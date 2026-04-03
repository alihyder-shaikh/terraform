module "network" {
  source = "../../modules/network"

  name          = "exalate"
  region        = var.region
  vpc_cidr      = var.vpc_cidr
  pods_cidr     = var.pods_cidr
  services_cidr = var.services_cidr
}

module "gke" {
  source = "../../modules/gke"

  name        = var.cluster_name
  region      = var.region
  project_id  = var.project_id

  network     = module.network.vpc_id
  subnetwork  = module.network.subnet_id

  master_cidr = var.master_cidr
}
