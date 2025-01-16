variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "destination" {
  description = "Destination"
  type        = string
}

variable "type" {
  description = "Route Type"
  type        = string
}

variable "nexthop" {
  description = "Nexthop where"
  type        = string
}

variable "description" {
  description = "Remark"
  type        = string
  default     = "Create By Terraform"
}

variable "route_table_id" {
  description = "Route Table ID"
  type        = string
  default     = "default"
}