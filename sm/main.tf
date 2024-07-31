resource "aws_secretsmanager_secret" "example" {
  #chekcov:skip=CKV2_AWS_57
  #chekcov:skip=CKV_AWS_149
  #checkov:skip=CKV_TF_1: "No need to use commit hash, easier to track with version"
  #chekcov:skip=CKV2_AWS_64
  for_each = toset(var.secrets_names)
  name     = each.key
}