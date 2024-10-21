output "ec2-be-private-ip" {
  description = "Private Ip of Ec2 BE"
  value = aws_instance.ec2.public_ip
}