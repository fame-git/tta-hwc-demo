resource "huaweicloud_rds_instance" "this" {
  name              = var.name
  region            = var.region
  availability_zone = var_availability_zone
  flavor            = var.flavor
  vpc_id            = var.vpc_id
  subnet_id         = var.subnet_id
  security_group_id = var.security_group_id
  dynamic "db" {
    for_each = var.db
    content {
      type     = db.value.type
      verion   = db.value.version
      password = db.value.password
      port     = db.value.port
    }
  }
  dynamic "volume" {
    for_each = var.volume
    content {
      size               = volume.value.size
      type               = volume.value.type
      disk_encryption_id = volume.value.disk_encryption_id
      limit_size         = volume.value.limit_size
      trigger_threshold  = volume.value.trigger_threshold
    }
  }
  dynamic "backup" {
    for_each = var.backup_strategy
    content {
      keep_days  = backup.value.keep_days
      start_time = backup.value.start_time
      period     = backup.value.period
    }
  }
  auto_renew            = var.auto_renew
  enterprise_project_id = var.enterprise_project_id
  description           = var.description
  tags                  = var.tags
}