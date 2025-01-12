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