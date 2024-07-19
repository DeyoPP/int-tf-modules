module "meta" {
  source = "../meta"
  meta   = var.meta
}

module "kms" {
  source  = "github.com/terraform-aws-modules/terraform-aws-kms?ref=fe1beca2118c0cb528526e022a53381535bb93cd"
}

