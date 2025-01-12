locals {
  bkk_time = timeadd(timestamp(), "7h")

  common_tags = {
    "Environment" = "dev"
    "Owner"       = "Team Cannonball"
    "CreateBy"    = "Terraform"
  }
}