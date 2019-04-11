output "http_https" {
  value = "${aws_security_group.allow_http.id}"
}

output "ssh" {
  value = "${aws_security_group.allow_ssh.id}"
}

