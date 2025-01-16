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

database = [
  {
    name                = "tta-prod-db"
    flavor              = "rds.pg.n1.medium.2.ha"
    vpc_name            = "tta-prod-vpc"
    subnet_name         = "tta-prod-subnet-db"
    security_group_name = "tta-prod-sg-db"
    db = [
      {
        type     = "PostgreSQL"
        version  = "16"
        password = "anyonecanjoin"
      }
    ]

    volume = [
      {
        size               = 100
        type               = "ESSD"
        disk_encryption_id = "tta-prod-kms-key"
      }
    ]

    backup_strategy = [
      {
        keep_days  = 1
        start_time = "08:00-09:00"
      }
    ]

    enterprise_project = "tta-prod"
  },
]

nat_gateway = [
  {
    name               = "tta-prod-natgateway"
    spec               = "3"
    vpc_name           = "tta-prod-vpc"
    subnet_name        = "tta-prod-subnet-front"
    enterprise_project = "tta-prod"
  },
]

eip = [
  {
    name = "tta-prod-eip"
    publicip = [
      {
        type = "10_bgp"
      }
    ]

    bandwidth = [
      {
        share_type = "PER"
        name       = "tta-prod-bandwidth"
      }
    ]
    enterprise_project = "tta-prod"
  }
]

snat = [
  {
    nat_gateway = "tta-prod-natgateway"
    eip         = "tta-prod-eip"
    subnet_name = "tta-prod-subnet-front"
    source_type = 0
  }
]

sec_group_rule = {
  "front-to-back" = {
    sec_group_name = "tta-prod-sg-front"
    direction      = "ingress"
    ethertype      = "IPv4"
    protocol       = "tcp"
    ports          = "22"
    action         = "allow"
    destination    = "tta-prod-sg-back"
  },
  "back-to-db" = {
    sec_group_name = "tta-prod-sg-back"
    direction      = "ingress"
    ethertype      = "IPv4"
    protocol       = "tcp"
    ports          = "5432"
    action         = "allow"
    destination    = "tta-prod-sg-db"
  }
}