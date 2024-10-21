module "pringram-vpc" {
  source = "../../modules/vpc"
  vpc_name = "Pingram-VPC"
  cider_block_vpc = "10.0.0.0/16"
  cidr_block_sub1 = "10.0.1.0/24"
  cidr_block_sub2 = "10.0.2.0/24"
  sub2_name = "Subnet2"
  sub1_name = "Subnet1"
}

module "ec2-fe" {
  vpc_id = module.pringram-vpc.pringram_vpc_id
  source = "../../modules/ec2-fe"
  sg_name = "FE-sg"
  ec2_ami = "ami-0ebfd941bbafe70c6"
  ec2_instance_type = "t2.micro"
  subnet_id_ec2 = module.pringram-vpc.subnet-1
  key_path = "pingram-key"
  ec2_fe_name = "Pringma-FE"
  ec2_public_ip = true
}

module "ec2-be" {
  source = "../../modules/ec2-be"
  vpc_id = module.pringram-vpc.pringram_vpc_id
  subnet_id_ec2 = module.pringram-vpc.subnet-2
  ec2_ami = "ami-0ebfd941bbafe70c6"
  ec2_instance_type = "t2.micro"
  key_path = "pingram-key"
  ec2_public_ip = true
  ec2_be_name = "Pringram-BE"
}
 
 
module "db-instance" {
  source = "../../modules/db-instance"
  db-instance-name = "SQL-Pringram"
  db_instance_ami = "ami-0ebfd941bbafe70c6"
  db_key_path = "pingram-key"
  db-vpc = module.pringram-vpc.pringram_vpc_id
  db_instance_type = "t2.micro"
  db_subnet_id = module.pringram-vpc.subnet-2
  private_ip_of_backend_server_for_db_ingress = module.ec2-be.ec2-be-private-ip
}
 