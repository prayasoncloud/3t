output "pringram_vpc_id" {
  description = "VPC ID"
  value = aws_vpc.vpc.id
}

output "subnet-1" {
  description = "Subnet Id"
  value = aws_subnet.sub1.id
}
output "subnet-2" {
  description = "Subnet Id"
  value = aws_subnet.sub2.id
}