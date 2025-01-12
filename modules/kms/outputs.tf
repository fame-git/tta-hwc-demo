output "id" {
  description = "KMS ID"
  value       = { for k, v in huaweicloud_kms_key.this : v.key_alias => v.id }
}