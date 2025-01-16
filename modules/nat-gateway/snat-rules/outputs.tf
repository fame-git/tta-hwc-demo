output "id" {
  description = "SNAT ID"
  value       = huaweicloud_nat_snat_rule.this.id
}

output "float_ip" {
  description = "Actual IP"
  value       = huaweicloud_nat_snat_rule.this.floating_ip_address
}

output "global_ip" {
  description = "Global IP"
  value       = huaweicloud_nat_snat_rule.this.global_eip_address
}