# Define variables
variable "external_secrets_name" {
  default = "external-secrets"
}

variable "external_secrets_repository" {
  default = "https://charts.external-secrets.io"
}

variable "external_secrets_chart" {
  default = "external-secrets"
}

variable "external_secrets_version" {
  default = "0.8.0"
}

variable "namespace" {
  default = "default"
}

variable "install_crds" {
  default = "true"
}

variable "service_account_create" {
  default = "false"
}

variable "service_account_name" {
  default = "external-secrets-sa"
}

variable "role_arn" {
  default = "arn:aws:iam::976552365380:role/karpenter-eks-node-group-20240820074628272500000001"
}

variable "secret_store_name" {
  default = "aws-secrets-manager"
}

variable "aws_region" {
  default = "eu-central-1"
}

variable "external_secret_name" {
  default = "my-external-secret"
}

variable "refresh_interval" {
  default = "15m"
}

variable "remote_secret_key" {
  default = "explorer_db_values"
}

variable "postgres_user_property" {
  default = "username"
}

variable "postgres_password_property" {
  default = "password"
}

variable "postgres_db_property" {
  default = "db_name"
}

variable "postgres_host_property" {
  default = "host"
}

variable "postgres_port_property" {
  default = "port"
}

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
