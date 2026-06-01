provider "aws" {
    alias = "ap-south-1"
    region = "ap-south-1"
}

provider "aws" {
    alias = "us-east-1"
    region = "us-east-1"
}

resource "aws_instance" "first-vm" {
    ami = "ami-09ed39e30153c3bf9"
    instance_type = "t2.micro"
    provider = "aws.ap-south-1"
}

resource "aws_instance" "second-vm" {
    ami = "ami-0236922087fa98b6e"
    instance_type = "t2.medium"
    provider = "aws.us-east-1"
}