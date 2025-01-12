variable "vm" {
  description = "ECS Module"
  type = list(object({
    name               = string
    region             = optional(string, "ap-southeast-2")
    flavor_id          = string
    image_id           = optional(string)
    security_group_ids = optional(list(string))
    availability_zone  = optional(string, "ap-southeast-2a")
    network = list(object({
      uuid              = string
      fixed_ip_v4       = optional(string)
      ipv6_enable       = optional(bool, false)
      source_dest_check = optional(bool, true)
      access_network    = optional(bool, false)
    }))
    system_disk_type       = optional(string, "GPSSD")
    system_disk_size       = optional(number)
    system_disk_kms_key_id = optional(string)
    system_disk_iops       = optional(number)
    system_disk_throughput = optional(number)

    data_disks = optional(list(object({
      type        = optional(string)
      size        = optional(string)
      snapshot_id = optional(string)
      kms_key_id  = optional(string)
      iops        = optional(number)
      throughput  = optional(number)
      dss_pool_id = optional(string)
    })), [])

    agency_name               = optional(string)
    charging_mode             = optional(string)
    stop_before_destroy       = optional(bool, true)
    delete_eip_on_termination = optional(bool, false)

    description           = optional(string, "CreatedByTerraform")
    enterprise_project_id = optional(string, "")
    tags                  = optional(map(any), null)
  }))
}