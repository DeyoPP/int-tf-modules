# Create IAM role and policy for ExternalDNS
resource "aws_iam_role" "external_dns" {
  name = "${var.cluster_name}-external-dns"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRoleWithWebIdentity"
      Effect = "Allow"
      Principal = {
        Federated = var.oidc_provider
      }
      Condition = {
        StringEquals = {
          "${var.oidc_provider}:sub" = "system:serviceaccount:${var.namespace}:external-dns"
        }
      }
    }]
  })
}

resource "aws_iam_role_policy" "external_dns_policy" {
  name   = "${var.cluster_name}-external-dns-policy"
  role   = aws_iam_role.external_dns.name
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = [
        "route53:ChangeResourceRecordSets",
        "route53:ListHostedZones",
        "route53:ListResourceRecordSets"
      ]
      Effect   = "Allow"
      Resource = "*"
    }]
  })
}

# Deploy the ExternalDNS Helm chart and let it create the Service Account
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
    value = "true"
  }

  set {
    name  = "serviceAccount.name"
    value = "external-dns"
  }

  set {
    name  = "serviceAccount.annotations.eks.amazonaws.com/role-arn"
    value = aws_iam_role.external_dns.arn
  }
}
