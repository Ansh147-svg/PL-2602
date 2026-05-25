provider "aws" {
    region = "ap-south-1"
}

variable "iam_users" {
    type = list(string)
    default = ["kastro", "sagarika", "kumar"]
}

output "user_string" {
    value = join(",", var.iam_users)
}