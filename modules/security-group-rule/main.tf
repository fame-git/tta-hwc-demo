resource "huaweicloud_networking_secgroup_rule" "this" {
  security_group_id       = var.security_group_id
  direction               = var.direction
  ethertype               = var.ethertype
  description             = var.description
  protocol                = var.protocol
  ports                   = var.ports
  action                  = var.action
  priority                = var.priority
  remote_ip_prefix        = var.remote_ip
  remote_group_id         = var.remote_group
  remote_address_group_id = var.remote_address_group
}