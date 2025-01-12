output "id" {
  description = "EIP ID"
  value       = { for k, v in huaweicloud_vpc_eip_associate.this : v.name => v.id }
}
