provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "web_sg" {

  name = "Devops-Galaxy-SG"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "devops_server" {

  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t3.micro"

  key_name = "galaxy-key"

  vpc_security_group_ids = [aws_security_group.web_sg.id]

user_data = <<-EOF
#!/bin/bash
apt update -y
apt install docker.io -y
systemctl start docker
systemctl enable docker
docker run -d -p 80:80 vigneshwari08/devops-galaxy
EOF

  tags = {
    Name = "DevOps-Galaxy-Server"
  }
}