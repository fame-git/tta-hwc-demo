variable "region" {
  description = "Region which DB will belong to"
  type        = string
  default     = "ap-southeast-2"
}

variable "name" {
  description = "DB instance name"
  type        = string
}

variable "spec" {
  description = "NAT spec"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
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
    "Type" = "NAT"
  }
}

variable "charging_mode" {
  description = "Charge Mode for NAT"
  type        = string
  default     = "postPaid"
}