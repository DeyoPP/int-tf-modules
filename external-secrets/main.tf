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

# Kubernetes manifest for SecretStore
resource "kubernetes_manifest" "secret_store" {
  manifest = {
    apiVersion = "external-secrets.io/v1alpha1"
    kind       = "SecretStore"
    metadata = {
      name      = var.secret_store_name
      namespace = var.namespace
    }
    spec = {
      provider = {
        aws = {
          service = "SecretsManager"
          region  = var.aws_region
          auth = {
            serviceAccountRef = {
              name = kubernetes_service_account.external_secrets_sa.metadata[0].name
            }
          }
        }
      }
    }
  }
}

# Kubernetes manifest for ExternalSecret
resource "kubernetes_manifest" "external_secret" {
  manifest = {
    apiVersion = "external-secrets.io/v1beta1"
    kind       = "ExternalSecret"
    metadata = {
      name      = var.external_secret_name
      namespace = var.namespace
    }
    spec = {
      refreshInterval = var.refresh_interval
      secretStoreRef = {
        name = var.secret_store_name
        kind = "SecretStore"
      }
      data = [
        {
          secretKey = "POSTGRES_USER"
          remoteRef = {
            key      = var.remote_secret_key
            property = var.postgres_user_property
          }
        },
        {
          secretKey = "POSTGRES_PASSWORD"
          remoteRef = {
            key      = var.remote_secret_key
            property = var.postgres_password_property
          }
        },
        {
          secretKey = "POSTGRES_DB"
          remoteRef = {
            key      = var.remote_secret_key
            property = var.postgres_db_property
          }
        },
        {
          secretKey = "POSTGRES_HOST"
          remoteRef = {
            key      = var.remote_secret_key
            property = var.postgres_host_property
          }
        },
        {
          secretKey = "POSTGRES_PORT"
          remoteRef = {
            key      = var.remote_secret_key
            property = var.postgres_port_property
          }
        }
      ]
    }
  }
}
