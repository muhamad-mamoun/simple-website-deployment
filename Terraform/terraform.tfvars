main_vpc_cidr = "10.0.0.0/16"

subnets = [{
  availability_zone = "us-east-1a"
  cidr              = "10.0.1.0/24"
  is_public         = true
  name              = "main-subnet"
}]
