output "base_ami" {
  value = "${data.aws_ami.base_ami.id}"
}
