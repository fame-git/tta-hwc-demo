module "enterprise" {
  source     = "../modules/enterprise_proj"
  enterprise = var.enterprise
}

module "vpc" {
  source = "../modules/vpc"
  vpc = [
    for v in var.vpc :
    merge(v,
      { tags = local.common_tags },
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
      { tags = local.common_tags }
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
}