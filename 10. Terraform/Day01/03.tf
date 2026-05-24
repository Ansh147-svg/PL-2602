#Using existing SG & existing Key pair- creation of VM
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "first-vm" {
  ami           = "ami-09ed39e30153c3bf9"
  instance_type = "t2.micro"
  key_name      = "keypair-b8"

  vpc_security_group_ids = [
    "sg-04aa35a0f25048e9a"
  ]

  tags = {
    Name = "dev-server"
  }
}