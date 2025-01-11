resource "huaweicloud_networking_secgroup" "this" {
  for_each              = { for v in var.sec_group : v.name => v }
  name                  = each.value.name
  region                = each.value.region
  description           = each.value.description
  enterprise_project_id = each.value.enterprise_project_id
  delete_default_rules  = each.value.delete_default_rules
  tags                  = each.value.tags
}