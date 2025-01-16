output "id" {
  description = "RDS ID"
  value       = huaweicloud_rds_instance.this.id
}

output "ip" {
  description = "RDS Private IP"
  value       = huaweicloud_rds_instance.this.private_ips
}