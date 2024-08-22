data "aws_region" "current" {}

locals {
  namespace = "kube-system"
}

resource "helm_release" "external_secrets" {
  version          = var.chart_version
  repository       = "https://charts.external-secrets.io"
  name             = var.service_account_name
  namespace        = local.namespace
  create_namespace = true
  chart            = "external-secrets"

  values = compact([
    templatefile("values.tftpl", {
      fullnameOverride       = var.service_account_name
      serviceAccount_roleArn = module.external_secret_service_account.iam_role_arn
      serviceAccount_name    = var.service_account_name
    })
  ])

  # it is highly recommended to enable webhook and certController according to: https://external-secrets.io/v0.8.0/api/components/
  set {
    name  = "webhook.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.external_secret_service_account.iam_role_arn
  }

}

resource "helm_release" "external_secrets_resources" {
  name      = "${var.service_account_name}-resources"
  namespace = local.namespace

  chart = "${path.module}/charts/external-secrets-resources"

  set {
    name  = "serviceAccount.name"
    value = var.service_account_name
  }

  set {
    name  = "serviceAccount.namespace"
    value = local.namespace
  }

  set {
    name  = "region"
    value = data.aws_region.current.name
  }

  depends_on = [
    helm_release.external_secrets
  ]
}