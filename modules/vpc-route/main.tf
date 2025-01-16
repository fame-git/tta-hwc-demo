resource "huaweicloud_vpc_route" "this" {
  vpc_id      = var.vpc_id
  destination = var.destination
  type        = var.type
  nexthop     = var.nexthop
  description = var.description
  region      = var.region
}