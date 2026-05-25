variable "ami_id" {
    description = "Enter AMI ID"
    type = string
    default = "ami-09ed39e30153c3bf9"
}

variable "instance_type" {
    description = "Enter Instance Type"
    type = string
    default = "t2.micro"
}

variable "instance_name" {
    description = "Enter Instance Name"
    type = string
    default = "dev-server"
}