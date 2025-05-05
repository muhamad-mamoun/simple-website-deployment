output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "subnets_id" {
  value = [for subnet in aws_subnet.subnets : subnet.id]
}

output "security_group_id" {
  value = aws_security_group.allow_ssh_http.id
}
