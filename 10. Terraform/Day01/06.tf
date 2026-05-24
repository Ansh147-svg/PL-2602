provider "aws" {
  region = "ap-south-1"
}

# Security Group
resource "aws_security_group" "terraform_server" {
  name        = "terraform-server"
  description = "Allow ports 80, 8080 and 9000"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-server"
  }
}

# EC2 Instances
resource "aws_instance" "servers" {

  for_each = toset([
    "dev-server-1",
    "dev-server-2"
  ])

  ami                    = "ami-09ed39e30153c3bf9"
  instance_type          = "t2.micro"
  key_name               = "keypair-b8"

  vpc_security_group_ids = [
    aws_security_group.terraform_server.id
  ]

  tags = {
    Name = each.key
  }
}