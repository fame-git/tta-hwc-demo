terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "=1.70.3"
    }
  }
}

provider "huaweicloud" {
  region     = "ap-southeast-2"
  access_key = var.access_key
  secret_key = var.secret_key
}