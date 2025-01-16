module "enterprise" {
  source     = "../modules/enterprise_proj"
  enterprise = var.enterprise
}

module "vpc" {
  source = "../modules/vpc"
  vpc = [
    for v in var.vpc :
    merge(v,
      { tags = merge(local.common_tags, v.tags) },
      { enterprise_project_id = module.enterprise.id[v.enterprise_project] }
    )
  ]

  depends_on = [module.enterprise]
}

module "subnet" {
  source = "../modules/subnet"
  subnet = [
    for v in var.subnet :
    merge(v,
      { vpc_id = module.vpc.id[v.vpc_name] },
      { tags = merge(local.common_tags, v.tags) }
    )
  ]

  depends_on = [module.vpc]
}

module "kms" {
  source = "../modules/kms"
  kms = [
    for v in var.kms_key :
    merge(v,
      { enterprise_project_id = module.enterprise.id[v.enterprise_project] }
    )
  ]

  depends_on = [module.enterprise]
}

module "sec_group" {
  source = "../modules/security-group"
  sec_group = [
    for v in var.sec_group :
    merge(v,
      { tags = merge(local.common_tags, v.tags) },
      { enterprise_project_id = module.enterprise.id[v.enterprise_project] }
    )
  ]

  depends_on = [module.enterprise]
}

module "vm" {
  source = "../modules/vm/instance"
  vm = [
    for v in var.vm :
    merge(v,
      {
        network = [
          for n in v.network :
          merge(
            n,
            { uuid = module.subnet.id[n.name] }
          )
        ]
      },
      { security_group_ids = [module.sec_group.id[v.security_group]] },
      { system_disk_kms_key_id = module.kms.id[v.system_disk_kms_key] },
      { tags = merge(local.common_tags, v.tags) },
      { enterprise_project_id = module.enterprise.id[v.enterprise_project] },
    )
  ]

  depends_on = [module.enterprise, module.subnet, module.sec_group]
}

module "database" {
  source            = "../modules/database"
  for_each          = { for v in var.database : v.name => v }
  name              = each.value.name
  flavor            = each.value.flavor
  vpc_id            = module.vpc.id[each.value.vpc_name]
  subnet_id         = module.subnet.id[each.value.subnet_name]
  security_group_id = module.sec_group.id[each.value.security_group_name]
  db                = each.value.db
  volume = [
    for v in each.value.volume :
    merge(v, { disk_encryption_id = module.kms.id[v.disk_encryption_id] })
  ]
  backup_strategy       = each.value.backup_strategy
  auto_renew            = each.value.auto_renew
  enterprise_project_id = module.enterprise.id[each.value.enterprise_project]
  tags                  = merge(local.common_tags, each.value.tags)

  depends_on = [module.enterprise, module.subnet, module.sec_group]
}

module "nat_gateway" {
  source                = "../modules/nat-gateway/gateway"
  for_each              = { for v in var.nat_gateway : v.name => v }
  name                  = each.value.name
  region                = each.value.region
  spec                  = each.value.spec
  vpc_id                = module.vpc.id[each.value.vpc_name]
  subnet_id             = module.subnet.id[each.value.subnet_name]
  enterprise_project_id = module.enterprise.id[each.value.enterprise_project]
  tags                  = merge(local.common_tags, each.value.tags)

  depends_on = [module.enterprise, module.subnet, module.sec_group]
}

module "eip" {
  source = "../modules/eip/eip-instance"
  eip = [
    for v in var.eip :
    merge(v,
      { enterprise_project_id = module.enterprise.id[v.enterprise_project] },
      { tags = merge(local.common_tags, v.tags) },
    )
  ]
}

module "snat" {
  source         = "../modules/nat-gateway/snat-rules"
  for_each       = { for v in var.snat : "${v.nat_gateway}-rule" => v }
  nat_gateway_id = module.nat_gateway[each.value.nat_gateway].id
  floating_ip_id = module.eip.id[each.value.eip]
  subnet_id      = module.subnet.id[each.value.subnet_name]
  source_type    = each.value.source_type
}

module "sec_group_rule" {
  source            = "../modules/security-group-rule"
  for_each          = var.sec_group_rule
  security_group_id = module.sec_group.id[each.value.sec_group_name]
  direction         = each.value.direction
  ethertype         = each.value.ethertype
  protocol          = each.value.protocol
  ports             = each.value.ports
  action            = each.value.action
  remote_group      = module.sec_group.id[each.value.destination]
}
