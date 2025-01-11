resource "huaweicloud_vpc_route" "this" {
  for_each    = var.vpc_route
  vpc_id      = each.value.vpc_id
  destination = each.value.destination
  type        = each.value.type
  nexthop     = each.value.nexthop
  description = each.value.description
  region      = each.value.region
}