module "network" {
  source       = "./modules/compute_network"
  network_name = "${var.NetworkName}"
  project_id   = var.project_id
}

output "network_name" {
  value       = "${module.network.name}"
  description = "The unique name of the network"
}

output "network_self_link" {
  value       = "${module.network.self_link}"
  description = "The URL of the created resource"
}

module "subnet_usw2" {
  source            = "./modules/compute_subnetwork"
  subnet_name       = "${var.SubnetName_usw2}"
  network_self_link = "${module.network.self_link}"
  subnet_region     = "${var.SubnetRegion_usw2}"
  project_id        = var.project_id
  ip_cidr_range     = "${var.IP_CIDR_Range_subnet_usw2}"
}

output "subnet_usw2_gateway_address" {
  value       = "${module.subnet_usw2.gateway_address}"
  description = "The IP address of the gateway."
}

output "subnet_usw2_self_link" {
  value       = "${module.subnet_usw2.self_link}"
  description = "The URL of the created resource"
}

output "subnet_usw2_subnet_region" {
  value = "${module.subnet_usw2.subnet_region}"
}