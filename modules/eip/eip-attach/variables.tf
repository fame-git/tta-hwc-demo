variable "eip_attach" {
  description = "EIP VPC associate Module"
  type = map(object({
    region     = optional(string, "ap-southeast-2")
    public_ip  = string
    fixed_ip   = optional(string)
    network_id = optional(string)
    port_id    = optional(string)
  }))
}