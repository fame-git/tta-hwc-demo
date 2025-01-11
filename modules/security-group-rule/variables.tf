variable "sec_group_rule" {
  description = "Security Group Rule Module"
  type = map(object({
    security_group_id    = string
    direction            = string
    ethertype            = string
    protocol             = optional(string)
    ports                = optional(string)
    action               = optional(string)
    priority             = optional(number)
    region               = optional(string, "ap-southeast-2")
    description          = optional(string, "Create by Terraform")
    remote_ip            = optional(string, null)
    remote_group         = optional(string, null)
    remote_address_group = optional(string, null)
  }))
}