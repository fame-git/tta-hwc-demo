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
    key_alias          = "tta-prod-kms-key"
    enterprise_project = "tta-prod"
  }
]

sec_group = [
  {
    name               = "tta-prod-sg-front"
    enterprise_project = "tta-prod"
  },
  {
    name               = "tta-prod-sg-back"
    enterprise_project = "tta-prod"
  },
  {
    name               = "tta-prod-sg-db"
    enterprise_project = "tta-prod"
  }
]

vm = [
  {
    name           = "tta-prod-vm-front"
    flavor_id      = "e6.52xlarge.28"
    image_name     = "CentOS 8.2 64bit"
    security_group = "tta-prod-sg-front"
    network = [
      {
        name = "tta-prod-subnet-front"
      }
    ]
    system_disk_type    = "ESSD2"
    system_disk_size    = 1024
    system_disk_kms_key = "tta-prod-kms-key"
    enterprise_project  = "tta-prod"
  },
  {
    name           = "tta-prod-vm-back"
    flavor_id      = "e6.52xlarge.28"
    image_name     = "CentOS 8.2 64bit"
    security_group = "tta-prod-sg-back"
    network = [
      {
        name = "tta-prod-subnet-back"
      }
    ]
    system_disk_type    = "ESSD2"
    system_disk_size    = 1024
    system_disk_kms_key = "tta-prod-kms-key"
    enterprise_project  = "tta-prod"
  },
]