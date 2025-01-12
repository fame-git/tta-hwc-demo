resource "huaweicloud_compute_instance" "this" {
  for_each           = { for v in var.vm : v.name => v }
  name               = each.value.name
  flavor_id          = each.value.flavor_id
  image_id           = each.value.image_id
  security_group_ids = each.value.security_group_ids
  availability_zone  = each.value.availability_zone
  dynamic "network" {
    for_each = each.value.network
    content {
      uuid              = network.value.uuid
      fixed_ip_v4       = network.value.fixed_ip_v4
      ipv6_enable       = network.value.ipv6_enable
      source_dest_check = network.value.source_dest_check
      access_network    = network.value.access_network
    }
  }
  system_disk_type       = each.value.system_disk_type
  system_disk_size       = each.value.system_disk_size
  system_disk_kms_key_id = each.value.system_disk_kms_key_id
  system_disk_iops       = each.value.system_disk_iops
  system_disk_throughput = each.value.system_disk_throughput
  dynamic "data_disks" {
    for_each = lookup(each.value, "data_disks", [])
    content {
      type        = data_disks.value.type
      size        = data_disks.value.size
      snapshot_id = data_disks.value.snapshot_id
      kms_key_id  = data_disks.value.kms_key_id
      iops        = data_disks.value.iops
      throughput  = data_disks.value.throughput
      dss_pool_id = data_disks.value.dss_pool_id
    }
  }
  agency_name               = each.value.agency_name
  charging_mode             = each.value.charging_mode
  stop_before_destroy       = each.value.stop_before_destroy
  delete_eip_on_termination = each.value.delete_eip_on_termination

  region                = each.value.region
  description           = each.value.description
  enterprise_project_id = each.value.enterprise_project_id
  tags                  = each.value.tags
}