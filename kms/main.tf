module "meta" {
  source = "../meta"
  meta   = var.meta
}

module "kms_name" {
  source  = "github.com/terraform-aws-modules/terraform-aws-kms?ref=fe1beca"
}

