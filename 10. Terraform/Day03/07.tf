provider "aws" {
    region = "ap-south-1"
}
terraform {
    backend "s3" {
        bucket = "s3-artificats-amazonprime"
        key = "prod/terraform.tfstate"
        region = "ap-south-1"
    }
}

resource "aws_instance" "first-vm" {
    ami = "ami-09ed39e30153c3bf9"
    instance_type = "t2.micro"
    tags = {
        Name = "backend-server"
    }
}

