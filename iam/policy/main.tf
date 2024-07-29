module "iam_policy" {
  source  = "git::https://github.com/terraform-aws-modules/iam//modules/iam-policy?ref=88435a9dfab0b038fae753ae79dfa1a3bea01710"
  
  create_policy = var.create_policy

  name        = module.meta.name
  description = "${module.meta.name} - provisioned by TF"
  path        = var.path
  policy      = var.policy

  tags = merge(module.meta.labels, {
    Environment = var.env.name
    Region      = var.env.region
  })
}