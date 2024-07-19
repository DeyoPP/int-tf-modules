module "meta" {
  source = "../meta"
  meta   = var.meta
}

module "dynamodb-table" {
  source  = "github.com/terraform-aws-modules/terraform-aws-dynamodb-table?ref=696ceab"
}