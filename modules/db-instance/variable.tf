variable "db-instance-name" {
  description = "name of the db"
  type = string
}

variable "db_instance_ami" {
  description = "AMI for DB instance"
  type = string
}

variable "db_instance_type" {
  description = "type of the db instance"
  type = string
}

variable "db_key_path" {
  description = "path for keypair"
  type = string
}

variable "db_subnet_id" {
  description = "subnet for db"
  type = string
}

variable "db-vpc" {
  description = "vpc for our db"
  type = string
}

variable "private_ip_of_backend_server_for_db_ingress" {
  description = "private of backend server that will communicate with DB"
  type = string
}