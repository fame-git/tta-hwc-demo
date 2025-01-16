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

# Enterprise project
variable "enterprise" {
  description = "Enterprise Project Service"
  type = list(object({
    name = string
    type = optional(string, "poc")
  }))
}

# VPC
variable "vpc" {
  description = "Virtual Private Connection"
  type = list(object({
    name               = string
    cidr               = string
    enterprise_project = optional(string, "default")
    tags               = optional(map(any), { "Type" = "VPC" })
  }))
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
}

# KMS Key
variable "kms_key" {
  description = "KMS"
  type = list(object({
    key_alias          = string
    key_algorithm      = optional(string, "AES_256")
    enterprise_project = optional(string, "default")
  }))
}

# Security Group
variable "sec_group" {
  description = "Security Group"
  type = list(object({
    name               = string
    enterprise_project = optional(string, "default")
    tags               = optional(map(any), { "Type" = "Security Group" })
  }))
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
      name        = string
      fixed_ip_v4 = optional(string)
    }))
    system_disk_type    = optional(string, "GPSSD")
    system_disk_size    = optional(number)
    system_disk_kms_key = optional(string)
    enterprise_project  = optional(string, "default")
    tags                = optional(map(any), { "Type" = "ECS" })
  }))
}

variable "database" {
  description = "DB"
  type = list(object({
    name                = string
    region              = optional(string, "ap-southeast-2")
    availability_zone   = optional(list(string), ["ap-southeast-2a"])
    flavor              = string
    vpc_name            = string
    subnet_name         = string
    security_group_name = string
    db = list(object({
      type     = string
      version  = string
      password = optional(string, null)
      port     = optional(number, null)
    }))
    volume = list(object({
      size               = number
      type               = string
      disk_encryption_id = optional(string, null)
      limit_size         = optional(number, null)
      trigger_threshold  = optional(number, null)
    }))
    backup_strategy = list(object({
      keep_days  = number
      start_time = string
      period     = optional(string)
    }))
    auto_renew         = optional(string, "false")
    enterprise_project = optional(string, "default")
    tags               = optional(map(any), { "Type" = "RDS" })
  }))
}

variable "nat_gateway" {
  description = "Public NAT Gateway"
  type = list(object({
    name               = string
    region             = optional(string, "ap-southeast-2")
    spec               = string
    vpc_name           = string
    subnet_name        = string
    enterprise_project = optional(string, "default")
    tags               = optional(map(any), { "Type" = "NAT" })
  }))
}