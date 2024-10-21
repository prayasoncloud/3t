resource "aws_security_group" "db-sg" {
  vpc_id = var.db-vpc
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["${var.private_ip_of_backend_server_for_db_ingress}/32"]  # Corrected here
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "db-instance" {
  ami = var.db_instance_ami
  instance_type = var.db_instance_type
  subnet_id = var.db_subnet_id
  key_name = var.db_key_path
  security_groups = [aws_security_group.db-sg.id]
  associate_public_ip_address = false
  tags = {
    Name = var.db-instance-name
  }
}