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

resource "null_resource" "invoke_ansible_playbook" {
  provisioner "local-exec" {
    command = <<END
              set -e;
              cd ../Ansible;
              echo "[app_servers]" > inventory.ini;
              echo "${module.compute.instance_public_ip}" >> inventory.ini;
              ansible-playbook -i inventory.ini playbook.yaml > output.log;
              END
  }

  depends_on = [module.compute]
}
