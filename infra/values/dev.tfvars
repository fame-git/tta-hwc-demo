enterprise = [
  {
    name = "tta-dev"
    type = "poc"
  },
]

vpc = [
  {
    name               = "tta-dev-vpc"
    cidr               = "10.0.0.0/16"
    enterprise_project = "tta-dev"
  },
]

subnet = [
  {
    name              = "tta-dev-subnet-front"
    cidr              = "10.0.0.0/24"
    vpc_name          = "tta-dev-vpc"
    availability_zone = "ap-southeast-2a"
  },
  {
    name              = "tta-dev-subnet-back"
    cidr              = "10.0.0.0/22"
    vpc_name          = "tta-dev-vpc"
    availability_zone = "ap-southeast-2a"
  },
  {
    name              = "tta-dev-subnet-db"
    cidr              = "10.0.1.0/24"
    vpc_name          = "tta-dev-vpc"
    availability_zone = "ap-southeast-2a"
  }
]

kms_key = [
  {
    key_alias = "tta-dev-kms-key"
  }
]
