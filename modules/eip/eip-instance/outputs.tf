output "id" {
  description = "EIP ID"
  value       = { for k, v in huaweicloud_vpc_eip.this : v.name => v.id }
}

output "ipv4_address" {
  description = "EIP ID"
  value       = { for k, v in huaweicloud_vpc_eip.this : v.name => v.address }
}