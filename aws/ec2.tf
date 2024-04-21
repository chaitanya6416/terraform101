resource "aws_instance" "public_instance" {
    ami = "ami-0c031a79ffb01a803"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public-subnet-1.id
    security_groups = [aws_security_group.ssh-http-sg.id]
    associate_public_ip_address = true
    # key_name = aws_key_pair.primary-key-pair.name
    user_data = <<-EOF
        #!/bin/bash

        # Install updates and dependencies
        sudo yum update -y
        sudo yum install -y httpd

        # Start Apache web server
        sudo systemctl start httpd
        sudo systemctl enable httpd

        # Create HTML file with private IP address
        cat <<HTML > /var/www/html/index.html
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>EC2 Private IP Address</title>
        </head>
        <body>
            <h1>Hello, World!</h1>
            <p>The private IP address of this EC2 instance is: $(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)</p>
        </body>
        </html>
        HTML

        # Adjust permissions
        sudo chmod 644 /var/www/html/index.html

        # Restart Apache
        sudo systemctl restart httpd
    EOF
    tags = {
        Name = "public-instance"
    }
}