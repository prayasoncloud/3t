resource "aws_security_group" "sg-fe" {  
    vpc_id = var.vpc_id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = var.sg_name
  }
}



resource "aws_instance" "ec2-fe" {
  ami = var.ec2_ami
  instance_type = var.ec2_instance_type
  key_name = var.key_path
  security_groups = [aws_security_group.sg-fe.id]
  subnet_id = var.subnet_id_ec2
  associate_public_ip_address = var.ec2_public_ip
  tags = {
    Name = var.ec2_fe_name
  }
}







