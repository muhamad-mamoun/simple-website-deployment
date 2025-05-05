output "instance_public_ip" {
  value = aws_instance.application_server.public_ip
}
