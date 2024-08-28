# IAM Role for External Secrets
resource "aws_iam_role" "external_secrets" {
  name = "${var.cluster_name}-external-secrets"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Federated" : "${var.oidc_provider}"
        },
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Condition" : {
          "StringEquals" : {
            "${var.oidc_url}:sub" : "system:serviceaccount:${var.namespace}:external-secrets",
            "${var.oidc_url}:aud" : "sts.amazonaws.com"
          }
        }
      }
    ]
  })
}

# IAM Policy for External Secrets
resource "aws_iam_role_policy" "external_secrets_policy" {
  #checkov:skip=CKV_AWS_290
  #checkov:skip=CKV_AWS_289  
  #checkov:skip=CKV_AWS_355
  name   = "${var.cluster_name}-external-secrets-policy"
  role   = aws_iam_role.external_secrets.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = [
        "secretsmanager:GetSecretValue",
        "secretsmanager:ListSecrets",
        "secretsmanager:DescribeSecret"
      ],
      Effect   = "Allow",
      Resource = "*"
    }]
  })
}


resource "helm_release" "external_secrets" {
  name       = "external-secrets"
  repository = "https://external-secrets.github.io/kubernetes-external-secrets/"
  chart      = "kubernetes-external-secrets"
  namespace  = var.namespace

  set {
    name  = "aws.secretsManager.enabled"
    value = "true"
  }

  set {
    name  = "aws.secretsManager.secretStore"
    value = "aws-secrets-manager"
  }

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.name"
    value = "external-secrets"
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.external_secrets.arn
  }
}

resource "kubernetes_external_secret" "db_secrets" {
  metadata {
    name      = "db-secrets"
    namespace = var.namespace
  }

  spec {
    backend_type = "secretsManager"

    data {
      name = "POSTGRES_USER"
      key  = "explorer_db_values"  # The key in AWS Secrets Manager
      property = "username"  # Specify the property inside the JSON object
    }

    data {
      name = "POSTGRES_PASSWORD"
      key  = "explorer_db_values"
      property = "password"  # Specify the property inside the JSON object
    }

    data {
      name = "POSTGRES_HOST"
      key  = "explorer_db_values"
      property = "host"  # Specify the property inside the JSON object
    }

    data {
      name = "POSTGRES_PORT"
      key  = "explorer_db_values"
      property = "port"  # Specify the property inside the JSON object
    }

    data {
      name = "POSTGRES_DB"
      key  = "explorer_db_values"
      property = "db_name"  # Specify the property inside the JSON object
    }

    refresh_interval = "1h"
  }
}
