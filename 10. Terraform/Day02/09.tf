#variables.tf
provider "aws" {
    region = "ap-south-1"
}
variable "instance_count" {
    description = "this is the count of VMs"
    type = number
}
variable "instance_ami" {
    description = "provide the ami of VMs"
    type = string
}
variable "instance_type" {
    description = "provide the instance type"
    type = string
}
variable "instance_name" {
    description = "provide instance name"
    type = string
}