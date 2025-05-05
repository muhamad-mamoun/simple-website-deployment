resource "aws_subnet" "subnets" {
  for_each          = { for subnet in var.subnets : subnet.name => subnet }
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.availability_zone

  tags = {
    Name = each.value.name
  }
}

resource "aws_route_table_association" "public_route_table_association" {
  for_each = { for public_subnet in var.subnets : public_subnet.name => public_subnet if public_subnet.is_public == true }

  subnet_id      = aws_subnet.subnets[each.value.name].id
  route_table_id = aws_route_table.public_route_table.id
}
