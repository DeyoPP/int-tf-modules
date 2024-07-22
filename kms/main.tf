module "meta" {
  source = "../meta"
  meta   = var.meta
}



module "kmss" {
  #checkov:skip=CKV_TF_1: "Commit hash"
  #checkov:skip=CKV_TF_2: "Problem 2"
  source  = "terraform-aws-modules/kms/aws"
  version = "3.1.0"
}



