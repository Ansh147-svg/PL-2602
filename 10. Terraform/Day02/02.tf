provider "aws" {
    region = "ap-south-1"
}
variable "public_subnets" {
    type = list(string)
    default = ["subnet-1a", "subnet-1b", "subnet-1c"]
}

variable "private_subnets" {
    type = list(string)
    default = ["subnet-1d", "subnet-1e", "subnet-1f"]
}

output "all_subnets" {
    value = concat(var.public_subnets, var.private_subnets)
}