resource "huaweicloud_vpc" "this" {
  for_each              = { for v in var.vpc : v.name => v }
  name                  = each.value.name
  cidr                  = each.value.cidr
  region                = each.value.region
  description           = each.value.description
  enterprise_project_id = each.value.enterprise_project_id
  tags                  = each.value.tags
}