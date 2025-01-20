locals {
  bkk_time = timeadd(timestamp(), "7h")

  common_tags = {
    "Environment" = "test"
    "Owner"       = "Team Cannonball"
    "CreateBy"    = "Terraform"
  }
}