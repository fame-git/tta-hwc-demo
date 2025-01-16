resource "huaweicloud_vpc_eip" "this" {
  for_each      = { for v in var.eip : v.name => v }
  name          = each.value.name
  region        = each.value.region
  charging_mode = each.value.charging_mode
  period_unit   = each.value.period_unit
  period        = each.value.period
  auto_renew    = each.value.auto_renew
  dynamic "publicip" {
    for_each = each.value.publicip
    content {
      type = publicip.value.type
    }
  }
  dynamic "bandwidth" {
    for_each = each.value.bandwidth
    content {
      share_type  = bandwidth.value.share_type
      name        = bandwidth.value.name
      size        = bandwidth.value.size
      charge_mode = bandwidth.value.charge_mode
    }
  }
  enterprise_project_id = each.value.enterprise_project_id
  tags                  = each.value.tags
}