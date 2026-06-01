provider "aws" {
    region = "ap-south-1"
}

locals {
    project_name = "netflix-project"
    environment = "prod"
    instance_count = 2

    tags = {
        Name = "${local.project_name}-${local.environment}"
        environment = local.environment
    }
}

resource "aws_instance" "first-vm" {
    ami = "ami-09ed39e30153c3bf9"
    instance_type = "t2.micro"
    count = local.instance_count
    tags = local.tags
}

output "instance_ids" {
    description = "List of EC2 Instance IDs"
    value = aws_instance.first-vm[*].id
}