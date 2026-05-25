provider "aws" {
    region = "ap-south-1"
}
variable "instance_types" {
    type = list(string)
    default = ["t2.micro", "t2.medium", "t4.large"]
}

output "selected_instance_type" {
    value = element(var.instance_types, 1)
}