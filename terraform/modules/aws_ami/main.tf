data "aws_ami" "base_ami" {
  most_recent      = true

   filter {
    name   = "name"
    values = ["${var.base_ami}"]
  }

  owners = ["${var.owner}"] 
}