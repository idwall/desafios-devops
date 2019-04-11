provider "aws" {
  profile = "default"
  region  = "${var.region}"
}

terraform {
  backend "local" {
    path = "../state/terraform.tfstate"
  }
}

data "template_file" "user-data" {
  template = "${file("../scripts/user-data.sh")}"
}

module "vpc" {
  source = "../modules/vpc"

  vpc_name    = "${var.vpc_name}"
  cidr_block  = "${var.cidr_block}"
  subnet_cidr = "${var.subnet_cidr}"
  subnet_name = "${var.subnet_name}"
  igw_name    = "${var.igw_name}"
  rt_name     = "${var.rt_name}"
  cidr_igw    = "${var.cidr_igw}"
}

module "aws_ami" {
  source = "../modules/aws_ami"

  base_ami = "${var.base_ami}"
  owner    = "${var.owner}"
}

module "key_pair" {
  source = "../modules/key_pair"

  key_name    = "${var.key_name}"
  aws_ssh_key = "${var.key_name}"
}

module "security_groups" {
  source = "../modules/security_groups"

  cidr_sg  = "${var.cidr_sg}"
  cidr_ssh = "${var.cidr_ssh}"
  vpc_id   = "${module.vpc.vpc_id}"
}

module "ec2" {
  source = "../modules/ec2"

  ami           = "${module.aws_ami.base_ami}"
  instance_type = "${var.instance_type}"
  key_name      = "${module.key_pair.key_name}"
  sg_ids        = ["${module.security_groups.http_https}", "${module.security_groups.ssh}"]
  subnet_id     = "${module.vpc.subnet_id}"
  instance_name = "${var.instance_name}"
  environment   = "${var.environment}"
  user_data     = "${data.template_file.user-data.rendered}"
}
