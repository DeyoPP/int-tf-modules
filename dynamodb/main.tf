module "meta" {
  source = "../meta"
  meta   = var.meta
}

module "dynamodb-table" {
  source  = "terraform-aws-modules/dynamodb-table/aws"
  version = "4.0.1"
}