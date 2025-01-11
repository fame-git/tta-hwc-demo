variable "vpc_route" {
  description = "VPC Route Module"
  type = map(object({
    vpc_id      = string
    destination = string
    type        = string
    nexthop     = string
    description = optional(string, "Create by Terraform")
    region      = optional(string, "ap-southeast-2")
  }))
}