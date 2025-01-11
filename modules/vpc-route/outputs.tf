output "id" {
  description = "VPC Route ID"
  value       = { for k, v in huaweicloud_vpc_route.this : k => v.id }
}

output "route_table_name" {
  description = "VPC Route Table name"
  value       = { for k, v in huaweicloud_vpc_route.this : k => v.route_table_name }
}