provider "aws" {
    region = "ap-south-1"
}
variable "tag_keys" {
    type = list(string)
    default = ["Name", "Environment", "App"]
}

variable "tag_values" {
    type = list(string)
    default = ["EC2Instance", "Production", "Netflix"]
}

output "ec2_tags" {
    value = zipmap(var.tag_keys, var.tag_values)
}