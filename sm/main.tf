resource "aws_secretsmanager_secret" "example" {
  #checkov:skip=CKV_AWS_149
  #checkov:skip=CKV2_AWS_57
  for_each = toset(var.secrets_names)
  name     = each.key
}