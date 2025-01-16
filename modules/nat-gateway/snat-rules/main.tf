resource "huaweicloud_nat_snat_rule" "this" {
  nat_gateway_id = var.nat_gateway_id
  floating_ip_id = var.floating_ip_id
  global_eip_id  = var.global_eip_id
  region         = var.region
  subnet_id      = var.subnet_id
  cidr           = var.cidr
  source_type    = var.source_type
  description    = var.description
}