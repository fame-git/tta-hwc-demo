variable "vpc" {
  description = "Virtual Private Connection Module"
  type = list(object({
    name                  = string
    cidr                  = string
    region                = optional(string, "ap-southeast-2")
    description           = optional(string, "Create by Terraform")
    enterprise_project_id = optional(string, null)
    tags                  = optional(map(any), { "Type" = "VPC" })
  }))
}