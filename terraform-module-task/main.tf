

# VPC Module
module "vpc" {
  source = "./modules/vpc"

  username                = var.username
  region                  = var.region
  auto_create_subnetworks = var.auto_create_subnetworks
  subnet_cidr             = var.subnet_cidr
}

# NAT Module
module "nat" {
  source = "./modules/nat"

  username                           = var.username
  region                             = var.region
  network_self_link                  = module.vpc.network_self_link
  nat_ip_allocate_option             = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
}

# VM Module
module "vm" {
  source = "./modules/vm"

  username          = var.username
  zone              = var.zone
  machine_type      = var.machine_type
  image             = var.image
  startup_script    = var.startup_script
  network_self_link = module.vpc.network_self_link
  subnet_self_link  = module.vpc.subnet_self_link
}