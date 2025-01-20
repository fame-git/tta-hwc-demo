# Based line variables
# ak/sk

variable "access_key" {
  description = "HW access key variable"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "HW secret key variable"
  type        = string
  sensitive   = true
}

# VPC
variable "vpc" {
  description = "Virtual Private Connection"
  type = list(object({
    name               = string
    cidr               = string
    tags               = optional(map(any), { "Type" = "VPC" })
  }))
  default = null
}

# Subnet
variable "subnet" {
  description = "Subnet"
  type = list(object({
    name              = string
    cidr              = string
    vpc_name          = string
    availability_zone = string
    tags              = optional(map(any), { "Type" = "Subnet" })
  }))
  default = null
}

# Security Group
variable "sec_group" {
  description = "Security Group"
  type = list(object({
    name               = string
    tags               = optional(map(any), { "Type" = "Security Group" })
  }))
  default = null
}

# VM
variable "vm" {
  description = "ECS"
  type = list(object({
    name           = string
    flavor_id      = string
    image_name     = optional(string)
    image_id       = optional(string)
    security_group = optional(string)
    network = list(object({
      uuid        = string
      fixed_ip_v4 = optional(string)
    }))
    system_disk_type    = optional(string, "SAS")
    system_disk_size    = optional(number)
    system_disk_kms_key = optional(string)
    enterprise_project  = optional(string, "default")
    tags                = optional(map(any), { "Type" = "ECS" })
  }))
  default = null
}

variable "sec_group_rule" {
  description = "Security Group Rule"
  type = map(object({
    sec_group_name = string
    direction      = string
    ethertype      = string
    protocol       = string
    ports          = string
    action         = string
    destination    = string
  }))
  default = null
}
