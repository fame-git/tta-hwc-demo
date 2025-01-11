output "id" {
  description = "VPC ID"
  value       = { for k, v in huaweicloud_vpc.this : v.name => v.id }
}