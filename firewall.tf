module "firewall-allow-ssh" {
  source            = "./modules/compute_firewall"
  fw_name           = "fw-allow-ssh-linux"
  network_self_link = module.network.self_link
  project_id        = var.project_id
  protocol          = "tcp"
  ports             = ["22"]
  target_tags       = ["linux"]
  source_ranges     = ["10.0.0.0/8"]
}

output "fw-allow-ssh_self_link" {
  description = "The URI of the created resource"
  value       = module.firewall-allow-ssh.self_link
}

module "firewall-allow-rdp" {
  source            = "./modules/compute_firewall"
  fw_name           = "fw-allow-rdp-windows"
  network_self_link = module.network.self_link
  project_id        = var.project_id
  protocol          = "tcp"
  ports             = ["3389"]
  target_tags       = ["windows"]
  source_ranges     = ["10.0.0.0/8"]
}

output "fw-allow-rdp_self_link" {
  description = "The URI of the created resource"
  value       = module.firewall-allow-rdp.self_link
}

module "firewall-allow-icmp" {
  source            = "./modules/compute_firewall"
  fw_name           = "fw-allow-icmp"
  network_self_link = module.network.self_link
  project_id        = var.project_id
  protocol          = "icmp"
  source_ranges     = ["10.0.0.0/8"]
}

output "fw-allow-icmp_self_link" {
  description = "The URI of the created resource"
  value       = module.firewall-allow-icmp.self_link
}


# module "firewall-allow-ad" {
#   source            = "./modules/compute_firewall"
#   fw_name           = "fw-allow-ad"
#   network_self_link = "${module.network.self_link}"
#   project_id        = var.project_id
#   protocol          = "tcp"
#   target_tags       = ["ad"]
#   source_ranges     = ["10.0.0.0/8"]
# }


# output "fw-allow-ad_self_link" {
#   description = "The URI of the created resource"
#   value       = "${module.firewall-allow-ad.self_link}"
# }

