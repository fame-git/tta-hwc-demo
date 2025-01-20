# module "vpc" {
#   source = "../modules/vpc"
#   vpc = [
#     {
#       name                  = "tta-test-vpc"
#       cidr                  = "172.16.0.0/24"
#       tags                  = local.common_tags
#     }
#   ]
# }

# module "subnet" {
#   source = "../modules/subnet"
#   subnet = [
#     {
#       name              = "tta-test-subnet"
#       cidr              = "172.16.0.32/27"
#       vpc_id            = module.vpc.id["tta-test-vpc"]
#       availability_zone = "ap-southeast-2a"
#       tags              = local.common_tags
#     }
#   ]

#   depends_on = [ module.vpc ]
# }

# module "sec_group" {
#   source = "../modules/security-group"
#   sec_group = [
#     {
#       name = "tta-test-sec-group"
#       tags = local.common_tags
#     }
#   ]

#   depends_on = [ module.vpc, module.subnet ]
# }

# module "vm" {
#   source = "../modules/vm/instance"
#   vm = [
#     {
#       name = "tta-test-vm"
#       flavor_id = "t6.small.1"
#       image_name = "CentOS Stream 9 64bit"
#       security_group_ids = [ module.sec_group.id["tta-test-sec-group"] ]
#       network = [
#         {
#           uuid = module.subnet.id["tta-test-subnet"]
#         }
#       ]
#       system_disk_type    = "SAS"
#       system_disk_size    = 40
#       tags                = local.common_tags
#     }
#   ]

#   depends_on = [ module.vpc, module.subnet ]
# }