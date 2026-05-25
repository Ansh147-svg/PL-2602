#test-team.tfvars
instance_count = 1
instance_ami = "ami-09ed39e30153c3bf9"
instance_type = "t2.micro"
instance_name = "test-server"

#dev-team.tfvars
instance_count = 2
instance_ami = "ami-07a00cf47dbbc844c"
instance_type = "t2.medium"
instance_name = "dev-server"

#prod-team.tfvars
instance_count = 3
instance_ami = "ami-07a00cf47dbbc844c"
instance_type = "t2.micro"
instance_name = "prod-server"