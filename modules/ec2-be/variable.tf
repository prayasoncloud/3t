variable "ec2_be_name" {
  description = "Name of Tthe Backend server"
  type = string
}

variable "ec2_ami" {
  description = "Varibale for Module EC2 ami"
  type = string
}

variable "ec2_instance_type" {
  description = "Variable for Module Ec2 Instance type"
  type = string
}

variable "subnet_id_ec2" {
  description = "Subnet for Ec2 Module"
  type = string
}

variable "ec2_public_ip" {
  description = "Associatee Public IP for ec2 module True or False"
  type = bool

}

variable "vpc_id" {
  description = "Vpc Id for instance"
  type = string
}

variable "key_path" {
  description = "path for key name"
  type = string
}

