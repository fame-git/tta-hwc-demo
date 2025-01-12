variable "kms" {
  description = "KMS Module"
  type = list(object({
    key_alias             = string
    key_algorithm         = optional(string, "AES_256")
    region                = optional(string, "ap-southeast-2")
    key_description       = optional(string, "Create by Terraform")
    enterprise_project_id = optional(string, "default")
    rotation_interval     = optional(number, "365")
    pending_days          = optional(string, "356")
  }))
}