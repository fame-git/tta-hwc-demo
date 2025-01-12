resource "huaweicloud_kms_key" "this" {
  for_each              = { for v in var.kms : v.key_alias => v }
    key_alias             = each.value.key_alias
    key_algorithm         = each.value.key_algorithm
    region                = each.value.region
    key_description       = each.value.key_description
    enterprise_project_id = each.value.enterprise_project_id
    rotation_enabled      = each.value.rotation_enabled
    rotation_interval     = each.value.rotation_interval
    pending_days          = each.value.pending_days
}