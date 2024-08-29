module "external_secret_service_account" {
  #checkov:skip=CKV_TF_1
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.30.0"

  role_name                      = "${var.cluster_name}-external-secret-role"
  attach_external_secrets_policy = true

  oidc_providers = {
    ex = {
      provider_arn               = var.oidc_provider
      namespace_service_accounts = ["kube-system:external-secrets"]
    }
  }
}