resource "helm_release" "external_secrets" {
  version          = var.chart_version
  repository       = "https://charts.external-secrets.io"
  name             = "external-secrets"
  namespace        = "kube-system"
  create_namespace = true
  chart            = "external-secrets"

  values = [templatefile("values.tftpl", {
    serviceAccount_roleArn = module.external_secret_service_account.iam_role_arn
    serviceAccount_name    = "external-secrets"
  })]

  set {
    name  = "webhook.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.external_secret_service_account.iam_role_arn
  }
}

resource "helm_release" "external_secrets_resources" {
  name      = "external-secrets-resources"
  namespace = "kube-system"

  chart = "${path.module}/charts/external-secrets-resources"

  set {
    name  = "serviceAccount.name"
    value = "external-secrets"
  }

  set {
    name  = "serviceAccount.namespace"
    value = "kube-system"
  }

  set {
    name  = "region"
    value = var.aws_region
  }

  depends_on = [
    helm_release.external_secrets
  ]
}

module "external_secret_service_account" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-iam//modules/iam-role-for-service-accounts-eks?ref=89fe17a6549728f1dc7e7a8f7b707486dfb45d89"

  role_name                      = "external-secrets-role"
  attach_external_secrets_policy = true

  oidc_providers = {
    ex = {
      provider_arn               = var.eks_oidc_provider_arn
      namespace_service_accounts = ["kube-system:external-secrets"]
    }
  }
}
