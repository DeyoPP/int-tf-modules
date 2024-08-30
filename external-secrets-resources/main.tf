resource "helm_release" "external_secrets_resources" {
  name      = "${var.namespace}-resources"
  namespace = var.namespace

  chart = "${path.module}/charts/external-secrets-resources"

  set {
    name  = "serviceAccount.name"
    value = "external-secrets"
  }

  set {
    name  = "serviceAccount.namespace"
    value = var.namespace
  }

  set {
    name  = "region"
    value = "eu-central-1"
  }

}