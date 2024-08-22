module "external_secret_service_account" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.30.0"

  role_name                      = "${module.meta.name}-external-secret-role"
  attach_external_secrets_policy = true

  oidc_providers = {
    ex = {
      provider_arn               = var.eks_oidc_provider_arn
      namespace_service_accounts = ["kube-system:${module.meta.name}"]
    }
  }
}