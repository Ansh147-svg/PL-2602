provider "aws" {
    region = "ap-south-1"
}
terraform {
    backend "s3" {
        bucket = "s3-artificats-amazonprime"
        key = "prod/terraform.tfstate"
        encrypt = true
        dynamodb_table = "dynamodb-terraform-state-lock" #dynamodb table name
        region = "ap-south-1"
    }
}
resource "aws_instance" "lock-instance" {
    ami = "ami-0685bcc683dadb6b9"
    instance_type = "t2.micro"
    tags = {
        Name = "backend-instance"
    }
}
