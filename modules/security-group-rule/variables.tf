variable "security_group_id" {
  description = "Security Group ID"
  type        = string
}

variable "direction" {
  description = "Direction"
  type        = string
}

variable "ethertype" {
  description = "Ethertype"
  type        = string
}

variable "protocol" {
  description = "Protocol"
  type        = string
  default     = null
}

variable "ports" {
  description = "Ports"
  type        = string
  default     = null
}

variable "action" {
  description = "Action"
  type        = string
  default     = null
}

variable "priority" {
  description = "Priority"
  type        = number
  default     = 1
}

variable "region" {
  description = "Region"
  type        = string
  default     = "ap-southeast-2"
}

variable "description" {
  description = "Remark"
  type        = string
  default     = "Create by Terraform"
}

variable "remote_ip" {
  description = "Bind by Remote IP"
  type        = string
  default     = null
}

variable "remote_group" {
  description = "Bind by security group"
  type        = string
  default     = null
}

variable "remote_address_group" {
  description = "Bind by IP address group"
  type        = string
  default     = null
}