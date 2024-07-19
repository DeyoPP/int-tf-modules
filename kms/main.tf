module "meta" {
  source = "../meta"
  meta   = var.meta
}

module "kms_name" {
  source  = "terraform-aws-modules/kms/aws"
  version = "3.1.0"
}