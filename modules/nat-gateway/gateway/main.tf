resource "huaweicloud_nat_gateway" "this" {
  name                  = var.name
  region                = var.region
  spec                  = var.spec
  vpc_id                = var.vpc_id
  subnet_id             = var.subnet_id
  enterprise_project_id = var.enterprise_project_id
  description           = var.description
  tags                  = var.tags
  charging_mode         = var.charging_mode
}