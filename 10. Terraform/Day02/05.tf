provider "aws" {
    region = "ap-south-1"
}
variable "ec2_tags" {
    type = map(string)
    default = {
        Name = "Kastro-Server"
        Env = "dev"
    }
}

output "environment_name" {
    value = lookup(var.ec2_tags, "Env")
}