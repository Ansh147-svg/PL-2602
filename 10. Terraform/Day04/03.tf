resource "aws_security_group" "web_sg" {
    name = "web-sg-provisioner"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["15.207.109.6/32"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
resource "aws_instance" "web-vm" {
    ami = "ami-0685bcc683dadb6b9"
    instance_type = "t2.micro"
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.web_sg.id]
    connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file(var.private_key_path)
        host = self.public_ip
    }
    provisioner "file" {
        source = "/home/ec2-user/index.html"
        destination = "/tmp/index.html"
    }
    provisioner "remote-exec" {
        inline = [
            "sudo yum install nginx -y",
            "sudo systemctl start nginx",
            "sudo mv /tmp/index.html /usr/share/nginx/html/index.html"
        ]
    }
}
