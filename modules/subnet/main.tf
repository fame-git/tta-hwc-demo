resource "huaweicloud_vpc_subnet" "this" {
  for_each          = { for v in var.subnet : v.name => v }
  name              = each.value.name
  cidr              = each.value.cidr
  vpc_id            = each.value.vpc_id
  region            = each.value.region
  description       = each.value.description
  availability_zone = each.value.availability_zone
  tags              = each.value.tags
}