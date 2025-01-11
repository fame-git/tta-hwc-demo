variable "subnet" {
  description = "Subnet Module"
  type = list(object({
    name              = string
    cidr              = string
    vpc_id            = string
    availability_zone = string
    region            = optional(string, "ap-southeast-2")
    description       = optional(string, "Create by Terraform")
    tags              = optional(map(any), { "Type" = "Subnet" })
  }))
}