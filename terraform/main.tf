# Root Module

# Calls child modules to create an AWS VPC network, EC2 images, ACM certificates and Route 53 records, and Ansible inventory and host variables files.

# This program is licensed under the terms of the GNU General Public License v3.0.

########################################
# Call Networking Module
########################################
module "networking" {

  source = "./modules/networking"

  project             = var.project
  env                 = var.env
  cidr_vpc            = var.cidr_vpc
  subnets             = var.subnets
  security_groups     = var.security_groups
  network_acls        = var.network_acls
  nat_gateway_subnets = var.nat_gateway_subnets
  route_tables        = var.route_tables
}

########################################
# Call EC2 Module
########################################
module "ec2" {

  source = "./modules/ec2"

  subnet_xref = module.networking.subnet_ids
  sg_xref     = module.networking.sg_ids
  project     = var.project
  env         = var.env
  key_pairs   = var.key_pairs
  instances   = var.instances
}

########################################
# Call Route53 Module
########################################
module "route53" {

  source = "./modules/route53"

  zone_id       = var.zone_id
  instance_data = module.ec2.instance_data
  #instance_data = module.apache.instance_data
  #instance_data = module.nginx.instance_data
}

########################################
# Call Ansible Module
########################################
module "ansible" {

  source = "./modules/ansible"

  # Ansible Inventory variables
  ansible_inventory_file = var.ansible_inventory_file
  ansible_host_vars_path = var.ansible_host_vars_path
  key_pairs              = var.key_pairs
  instances              = var.instances
  instance_data          = module.ec2.instance_data

}
