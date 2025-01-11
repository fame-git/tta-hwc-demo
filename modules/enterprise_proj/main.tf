resource "huaweicloud_enterprise_project" "this" {
  for_each                = { for v in var.enterprise : v.name => v }
  name                    = each.value.name
  description             = each.value.description
  type                    = each.value.type
  enable                  = each.value.enable
  skip_disable_on_destroy = each.value.skip_disable_on_destroy
}