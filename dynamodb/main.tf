module "dynamodb-table" {
  source  = "git::https://github.com/terraform-aws-modules/terraform-aws-dynamodb-table?ref=696ceabbfdd49f8246e3d401c035729d60ea6fab"

  attributes                  = var.attributes
  name                        = var.name
  billing_mode                = var.billing_mode
  hash_key                    = var.hash_key
  range_key                   = var.range_key
  read_capacity               = var.read_capacity
  write_capacity              = var.write_capacity
  stream_enabled              = var.stream_enabled
  stream_view_type            = var.stream_view_type
  table_class                 = var.table_class
  deletion_protection_enabled = var.deletion_protection_enabled
  ttl_enabled                 = var.ttl_enabled
  ttl_attribute_name          = var.ttl_attribute_name
  

}