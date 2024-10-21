
output "db-instance-private-ip" {
  description = "Private Ip of db"
  value = aws_instance.db-instance.private_ip
}