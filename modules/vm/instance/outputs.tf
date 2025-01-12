output "id" {
  description = "ECS ID"
  value = { for k, v in huaweicloud_compute_instance.this : k => v.id }
}

output "ip" {
  description = "Private IP"
  value = { for k, v in huaweicloud_compute_instance.this : k => v.access_ip_v4 }
}