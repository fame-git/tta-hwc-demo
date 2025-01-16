variable "region" {
  description = "Region which DB will belong to"
  type        = string
  default     = "ap-southeast-2"
}

variable "availability_zone" {
  description = "Availability Zone for RDS"
  type        = string
  default     = "ap-southeast-2a"
}

variable "name" {
  description = "DB instance name"
  type        = string
}

variable "flavor" {
  description = "DB spec"
  type        = string
}

variable "db" {
  description = "Database information"
  type = list(object({
    type     = string
    version  = string
    password = optional(string, null)
    port     = optional(number, null)
  }))
  default = []
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID"
  type        = string
}

variable "volume" {
  description = "DB volume"
  type = list(object({
    size               = number
    type               = string
    disk_encryption_id = optional(string, null)
    limit_size         = optional(number, null)
    trigger_threshold  = optional(number, null)
  }))
  default = []
}

variable "backup_strategy" {
  description = "Backup strategy"
  type = list(object({
    keep_days  = number
    start_time = string
    period     = string
  }))
}

variable "auto_renew" {
  description = "Auto Renew"
  type        = string
  default     = "false"
}

variable "enterprise_project_id" {
  description = "Enterprise Project ID"
  type        = string
  default     = null
}

variable "description" {
  description = "For Remark"
  type        = string
  default     = "Create By Terraform"
}

variable "tags" {
  description = "Tags"
  type        = map(any)
  default = {
    "Type" = "RDS"
  }
}