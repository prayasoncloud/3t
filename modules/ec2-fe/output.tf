output "ec2-fe-public_ip" {
  description = "EC2 - Front End Public IP"
  value = aws_instance.ec2-fe.public_ip
}

output "ec2-fe-private_ip" {
  description = "EC2 - Front End private IP"
  value = aws_instance.ec2-fe.private_ip
}
