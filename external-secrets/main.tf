# Helm release resource
resource "helm_release" "external_secrets" {
  name       = var.external_secrets_name
  repository = var.external_secrets_repository
  chart      = var.external_secrets_chart
  version    = var.external_secrets_version

  namespace = var.namespace

  set {
    name  = "installCRDs"
    value = var.install_crds
  }

  set {
    name  = "serviceAccount.create"
    value = var.service_account_create
  }
}

# Kubernetes service account resource
resource "kubernetes_service_account" "external_secrets_sa" {
  metadata {
    name      = var.service_account_name
    namespace = var.namespace
    annotations = {
      "eks.amazonaws.com/role-arn" = var.role_arn
    }
  }
}

resource "kubernetes_manifest" "secret_store" {
  manifest = var.secret_store_manifest
}

resource "kubernetes_manifest" "external_secret" {
  manifest = var.external_secret_manifest
}
