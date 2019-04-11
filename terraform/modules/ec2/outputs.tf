output "public_ip" {
  value = "${aws_instance.generic_ec2.public_ip}"
}
