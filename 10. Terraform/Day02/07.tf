provider "aws" {
    region = "ap-south-1"
}
variable "roles" {
    type = set(string)
    default = ["admin", "developer", "tester", "developer"]
}

output "unique_roles" {
    value = tolist(var.roles)
}