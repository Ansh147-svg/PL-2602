output "instance_id" {
    value = aws_instance.ec2_instance.id
}
output "pubic_ip" {
    value = aws_instance.ec2_instance.public_ip
}