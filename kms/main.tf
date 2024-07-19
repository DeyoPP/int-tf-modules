module "meta" {
  source = "../meta"
  meta   = var.meta
}



module "kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = "3.1.0"
}



