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
    key_alias          = "tta-dev-kms-key"
    enterprise_project = "tta-dev"
  }
]

sec_group = [
  {
    name               = "tta-dev-sg-front"
    enterprise_project = "tta-dev"
  },
  {
    name               = "tta-dev-sg-back"
    enterprise_project = "tta-dev"
  },
  {
    name               = "tta-dev-sg-db"
    enterprise_project = "tta-dev"
  }
]

vm = [
  {
    name           = "tta-dev-vm-front"
    flavor_id      = "s3.small.1"
    image_name     = "CentOS 8.2 64bit"
    security_group = "tta-dev-sg-front"
    network = [
      {
        name = "tta-dev-subnet-front"
      }
    ]
    system_disk_type    = "SAS"
    system_disk_size    = 40
    system_disk_kms_key = "tta-dev-kms-key"
    enterprise_project  = "tta-dev"
  },
  {
    name           = "tta-dev-vm-back"
    flavor_id      = "s3.small.1"
    image_name     = "CentOS 8.2 64bit"
    security_group = "tta-dev-sg-back"
    network = [
      {
        name = "tta-dev-subnet-back"
      }
    ]
    system_disk_type    = "SAS"
    system_disk_size    = 40
    system_disk_kms_key = "tta-dev-kms-key"
    enterprise_project  = "tta-dev"
  },
]