locals {  aws_ssh_key = "${var.aws_ssh_key}" }

resource "tls_private_key" "idwall_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "idwall_aws" {
  key_name   = "${var.key_name}"
  public_key = "${tls_private_key.idwall_key.public_key_openssh}"
}

resource "local_file" "aws_ssh_key" {
  depends_on = ["tls_private_key.idwall_key"]
  content    = "${tls_private_key.idwall_key.private_key_pem}"
  filename   = "${local.aws_ssh_key}"
  provisioner "local-exec" {
    command = "chmod 0400 '${var.aws_ssh_key}'" }
}
