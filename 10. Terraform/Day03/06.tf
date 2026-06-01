provider "aws" {
    region = "ap-south-1"
}
locals {
    instance_types = {
        dev = "t2.micro"
        test = "t2.small"
        prod = "t2.medium"
    }
}
resource "aws_instance" "workspace-demo" {
    ami = "ami-09ed39e30153c3bf9"
    instance_type = local.instance_types[terraform.workspace]

    tags = {
        Name = "${terraform.workspace}-server"
    }
}

output "active_workspace" {
    value = terraform.workspace
}
output "selected_instance_type" {
    value = local.instance_types[terraform.workspace]
}