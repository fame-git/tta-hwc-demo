output "id" {
  description = "VPC Route ID"
  value       = huaweicloud_vpc_route.this.id
}

output "route_table_name" {
  description = "VPC Route Table name"
  value       = huaweicloud_vpc_route.this.route_table_name
}