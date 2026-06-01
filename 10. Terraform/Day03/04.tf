provider "aws" {
    region = "ap-south-1"
}
resource "aws_instance" "first-vm" {
    ami = "ami-09ed39e30153c3bf9"
    instance_type = "t2.micro"
    tags = {
        Name = "taint-server"
    }
}

resource "aws_s3_bucket" "my-first-bucket" {
    bucket = "kastro-26052026-dev-amazonprime"
}