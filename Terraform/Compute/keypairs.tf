resource "tls_private_key" "application_server_keypair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "application_server_access" {
  key_name   = "application_server_access"
  public_key = tls_private_key.application_server_keypair.public_key_openssh
}

resource "local_file" "ssh-key" {
  content         = tls_private_key.application_server_keypair.private_key_openssh
  filename        = "ssh-keypair.pem"
  file_permission = "0600"
}
