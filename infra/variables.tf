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
