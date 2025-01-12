resource "huaweicloud_vpc_eip_associate" "this" {
  for_each   = var.eip_attach
  public_ip  = each.value.public_ip
  fixed_ip   = each.value.fixed_ip
  network_id = each.value.network_id
  port_id    = each.value.port_id
}