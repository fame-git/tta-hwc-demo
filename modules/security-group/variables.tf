variable "sec_group" {
  description = "Security Group Module"
  type = list(object({
    name                  = string
    region                = optional(string, "ap-southeast-2")
    description           = optional(string, "Create by Terraform")
    enterprise_project_id = optional(string, "default")
    delete_default_rules  = optionla(bool, false)
    tags                  = optional(map(any), { "Type" = "Security Group" })
  }))
}