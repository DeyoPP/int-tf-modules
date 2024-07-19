module "meta" {
  source = "../meta"
  meta   = var.meta
}

module "dynamodb-table" {
  source  = "terraform-aws-modules/dynamodb-table/aws"
  version = "3.3.0"

  name = var.table_name != "" ? var.table_name : module.meta.name

  autoscaling_enabled = var.autoscaling_enabled

  attributes = var.attributes

  hash_key = var.hash_key

  range_key = var.range_key

  write_capacity = var.billing_mode == "PROVISIONED" ? var.write_capacity : null

  read_capacity = var.billing_mode == "PROVISIONED" ? var.read_capacity : null

  billing_mode = var.billing_mode

  point_in_time_recovery_enabled = var.point_in_time_recovery_enabled

  global_secondary_indexes = var.global_secondary_indexes

  deletion_protection_enabled = var.deletion_protection_enabled

  stream_enabled = var.stream_enabled

  stream_view_type = var.stream_view_type

  ttl_attribute_name = var.ttl.attribute_name

  ttl_enabled = var.ttl.enabled
}

resource "aws_lambda_event_source_mapping" "lambda" {
  for_each = toset(var.lambda_arns_to_trigger)

  event_source_arn  = module.dynamodb-table.dynamodb_table_stream_arn
  function_name     = each.key
  starting_position = "LATEST"
}