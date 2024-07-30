resource "aws_secretsmanager_secret" "example" {
  #chekcov:skip=CKV2_AWS_57
  #chekcov:skip=CKV_AWS_149
  for_each = toset(var.secrets_names)
  name     = each.key
}