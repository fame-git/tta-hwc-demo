variable "enterprise" {
  description = "Enterprise Project Module"
  type = list(object({
    name                    = string
    type                    = optional(string, "poc")
    enable                  = optional(bool, true)
    description             = optional(string, "Create by Terraform")
    skip_disable_on_destroy = optional(bool, false)
  }))
}