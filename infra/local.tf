locals {
  bkk_time = timeadd(timestamp(), "7h")

  common_tags = {
    "Environment" = "test"
    "Owner"       = "Team Cannonball"
    "CreateBy"    = "Terraform"
  }

  image_centos = data.huaweicloud_images_image.centos
}

data "huaweicloud_images_image" "centos" {
  name         = "CentOS 8.2 64bit"
}