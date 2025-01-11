output "id" {
  description = "Sec Group ID"
  value       = { for v in huaweicloud_networking_secgroup.this : v.name => v.id }
}