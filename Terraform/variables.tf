variable "main_vpc_cidr" {
  type = string
}

variable "subnets" {
  type = list(object({
    name              = string
    cidr              = string
    is_public         = bool
    availability_zone = string
  }))
}
