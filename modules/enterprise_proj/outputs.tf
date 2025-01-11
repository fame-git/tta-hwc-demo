output "id" {
  description = "Enterprise Project ID"
  value       = { for k, v in huaweicloud_enterprise_project.this : v.name => v.id }
}