variable "region" {
  description = "Qual regiao deseja utilizar?"
}
variable "cidr_ssh" {
  description = "Qual range deseja liberar para acesso SSH?"
}

variable "instance_name" {
  default = "idwall-challenge"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "base_ami" {
  default = "amzn2-ami-hvm-2.0.*-x86_64-gp2"
}

variable "owner" {
  default = "amazon"
}

variable "environment" {
  default = "develop"
}

variable "key_name" {
  default = "idwall"
}

variable "cidr_sg" {
  default = "0.0.0.0/0"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  default = "idwall-vpc"
}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "subnet_name" {
  default = "pub-subnet"
}

variable "igw_name" {
  default = "idwall_igw"
}

variable "rt_name" {
  default = "idwall_rt"
}

variable "cidr_igw" {
  default = "0.0.0.0/0"
}
