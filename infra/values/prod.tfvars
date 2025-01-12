enterprise = [
  {
    name = "tta-prod"
    type = "prod"
  },
]

vpc = [
  {
    name               = "tta-prod-vpc"
    cidr               = "10.0.0.0/16"
    enterprise_project = "tta-prod"
  },
]

subnet = [
  {
    name              = "tta-prod-subnet-front"
    cidr              = "10.0.0.0/24"
    vpc_name          = "tta-prod-vpc"
    availability_zone = "ap-southeast-2a"
  },
  {
    name              = "tta-prod-subnet-back"
    cidr              = "10.0.0.0/22"
    vpc_name          = "tta-prod-vpc"
    availability_zone = "ap-southeast-2a"
  },
  {
    name              = "tta-prod-subnet-db"
    cidr              = "10.0.1.0/24"
    vpc_name          = "tta-prod-vpc"
    availability_zone = "ap-southeast-2a"
  }
]

kms_key = [
  {
    key_alias = "tta-prod-kms-key"
  }
]