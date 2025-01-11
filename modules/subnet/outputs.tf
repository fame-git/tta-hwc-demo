output "id" {
  description = "Subnet ID"
  value       = { for k, v in huaweicloud_vpc_subnet.this : v.name => v.id }
}