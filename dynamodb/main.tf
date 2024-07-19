module "meta" {
  source = "../meta"
  meta   = var.meta
}

module "dynamodb-table" {
  source  = "github.com/terraform-aws-modules/terraform-aws-dynamodb-table?ref=696ceabbfdd49f8246e3d401c035729d60ea6fab"
}