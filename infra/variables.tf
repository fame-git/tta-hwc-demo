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