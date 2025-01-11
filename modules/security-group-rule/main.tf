resource "huaweicloud_networking_secgroup_rule" "this" {
  for_each                = var.sec_group_rule
  security_group_id       = each.value.security_group_id
  direction               = each.value.direction
  ethertype               = each.value.ethertype
  description             = each.value.description
  protocol                = each.value.protocol
  ports                   = each.value.ports
  action                  = each.value.action
  priority                = each.value.priority
  remote_ip_prefix        = each.value.remote_ip_prefix
  remote_group_id         = each.value.remote_group_id
  remote_address_group_id = each.value.remote_address_group_id
}