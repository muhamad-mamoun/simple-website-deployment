module "network" {
  source        = "./Network"
  main_vpc_cidr = var.main_vpc_cidr
  subnets       = var.subnets
}

module "compute" {
  source                     = "./Compute"
  instance_subnet_id         = module.network.subnets_id[0]
  instance_security_group_id = module.network.security_group_id

  depends_on = [module.network]
}
