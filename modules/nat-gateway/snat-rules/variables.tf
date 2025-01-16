variable "region" {
  description = "Region which DB will belong to"
  type        = string
  default     = "ap-southeast-2"
}

variable "nat_gateway_id" {
  description = "Nat Gateway ID"
  type        = string
}

variable "floating_ip_id" {
  description = "EIP ID"
  type        = string
  default = null
}

variable "global_eip_id" {
  description = "GEIP ID"
  type        = string
  default = null
}

variable "subnet_id" {
  description = " Subnet ID"
  type        = string
  default     = null
}

variable "cidr" {
  description = "CIDR"
  type        = string
  default     = null
}

variable "source_type" {
  description = "Source Type"
  type        = number
  default     = 0
}

variable "description" {
  description = "For Remark"
  type        = string
  default     = "Create By Terraform"
}
