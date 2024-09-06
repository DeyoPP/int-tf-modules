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


resource "aws_iam_role_policy" "external_secrets_policy" {
  #checkov:skip=CKV_AWS_288
  #checkov:skip=CKV_TF_1
  #checkov:skip=CKV_AWS_290
  #checkov:skip=CKV_AWS_355
  name   = "${var.cluster_name}-external-secrets-policy"
  role   = aws_iam_role.external_secrets.name
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ],
        Effect   = "Allow",
        Resource = "*"
      },
      {
        Action = [
          "kms:Decrypt"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}
#


resource "helm_release" "external_secrets" {
  repository       = "https://charts.external-secrets.io"
  name             = "external-secrets"
  namespace        = var.namespace
  create_namespace = true
  chart            = "external-secrets"

  values = compact([
    templatefile("${path.module}/values.tftpl", {
      fullnameOverride       = "external-secrets"
      serviceAccount_roleArn = aws_iam_role.external_secrets.arn
      serviceAccount_name    = "external-secrets"
    })
  ])

  # Enabling webhook and certController as recommended
  set {
    name  = "webhook.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.external_secrets.arn
  }

  set {
    name  = "certController.enabled"
    value = "true"
  }

  set {
    name  = "webhook.enabled"
    value = "true"
  }
}



# resource "kubernetes_manifest" "external_secret" {
#   manifest = {
#     apiVersion = "external-secrets.io/v1beta1"
#     kind       = "ExternalSecret"
#     metadata = {
#       name      = "explorer-db-secret"
#       namespace = var.namespace
#     }
#     spec = {
#       refreshInterval = "1h"
#       secretStoreRef = {
#         name = "aws-secrets-manager"
#         kind = "SecretStore"
#       }
#       target = {
#         name           = "explorer-db-secret"  # Name of the Kubernetes secret to be created
#         creationPolicy = "Owner"
#       }
#       data = [
#         {
#           secretKey = "POSTGRES_USER"  # Kubernetes Secret key
#           remoteRef = {
#             key      = "explorer_db_values"  # AWS Secrets Manager key
#             property = "username"            # JSON key in the AWS Secret
#           }
#         },
#         {
#           secretKey = "POSTGRES_PASSWORD"
#           remoteRef = {
#             key      = "explorer_db_values"
#             property = "password"
#           }
#         },
#         {
#           secretKey = "POSTGRES_HOST"
#           remoteRef = {
#             key      = "explorer_db_values"
#             property = "host"
#           }
#         },
#         {
#           secretKey = "POSTGRES_PORT"
#           remoteRef = {
#             key      = "explorer_db_values"
#             property = "port"
#           }
#         },
#         {
#           secretKey = "POSTGRES_DB"
#           remoteRef = {
#             key      = "explorer_db_values"
#             property = "db_name"
#           }
#         }
#       ]
#     }
#   }

#   depends_on = [
#     helm_release.external_secrets,
#   ]
# }
