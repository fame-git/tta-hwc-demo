output "id" {
  description = "Sec Group Rule ID"
  value       = { for k, v in huaweicloud_networking_secgroup_rule.this : k => v.id }
}