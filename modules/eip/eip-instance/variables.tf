variable "eip" {
  description = "EIP Module"
  type = list(object({
    name          = string
    region        = optional(string, "ap-southeast-2")
    charging_mode = optional(string, "prePaid")
    period_unit   = optional(string, "month")
    period        = optional(number, 3)
    auto_renew    = optional(bool, false)

    publicip = list(object({
      type = optional(string, "5_bgp")
    }))

    bandwidth = list(object({
      share_type  = string
      name        = optional(string)
      size        = optional(number, 5)
      charge_mode = optional(string, "traffic")
    }))
    enterprise_project_id = optional(string, "default")
    tags                  = optional(map(any), { "Type" = "EIP" })
  }))
}