resource "aws_vpc" "main_vpc" {
  cidr_block = var.main_vpc_cidr
}
