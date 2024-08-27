resource "helm_release" "external_dns" {
  name       = "external-dns"
  repository = "https://kubernetes-sigs.github.io/external-dns/"
  chart      = "external-dns"
  namespace  = var.namespace

  set {
    name  = "provider"
    value = "aws"
  }

  set {
    name  = "aws.zoneType"
    value = var.zone_type
  }

  set {
    name  = "policy"
    value = var.policy
  }

  set {
    name  = "registry"
    value = var.registry
  }

  set {
    name  = "aws.region"
    value = var.region
  }

  set {
    name  = "txtOwnerId"
    value = var.cluster_name
  }

  set {
    name  = "domainFilters[0]"
    value = var.domain_filter
  }

  set {
    name  = "sources"
    value = "{service,ingress}"
  }

  set {
    name  = "txtPrefix"
    value = var.txt_prefix
  }

  set {
    name  = "aws.hostedZoneID"
    value = var.hosted_zone_id
  }

  set {
    name  = "serviceAccount.create"
    value = "false"
  }

  set {
    name  = "serviceAccount.name"
    value = kubernetes_service_account.external_dns.metadata[0].name
  }
}


resource "kubernetes_service_account" "external_dns" {
  metadata {
    name      = "external-dns"
    namespace = var.namespace
  }
}

resource "aws_iam_role" "external_dns_role" {
  name = "external-dns-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity",
        Effect = "Allow",
        Principal = {
          Federated = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${var.oidc_provider}"
        },
        Condition = {
          StringEquals = {
            "${var.oidc_provider}:sub" = "system:serviceaccount:${var.namespace}:external-dns"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "external_dns_policy" {
  #checkov:skip = CKV_AWS_290
  #checkov:skip = CKV_AWS_355
  name = "external-dns-policy"
  role = aws_iam_role.external_dns_role.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "route53:ChangeResourceRecordSets",
          "route53:ListHostedZones",
          "route53:ListResourceRecordSets"
        ],
        Resource = "*"
      }
    ]
  })
}

module "eks_irsa" {
  #checkov:skip=CKV_TF_1: "No need to use commit hash, easier to track with version"
  #checkov:skip=CKV_TF_2

  source          = "terraform-aws-modules/iam-eks-role/aws"
  name            = "external-dns-irsa"
  service_account = "external-dns"
  namespace       = var.namespace
  oidc_provider   = var.oidc_provider

  policies = [
    "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
  ]
}

resource "aws_iam_role_policy_attachment" "external_dns_policy_attachment" {
  role       = aws_iam_role.external_dns_role.name
  policy_arn = aws_iam_policy.external_dns_policy.arn
}
