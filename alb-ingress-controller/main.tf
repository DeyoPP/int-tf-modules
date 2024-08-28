# IAM Role for ALB Ingress Controller
resource "aws_iam_role" "alb_ingress_controller" {
  name = "${var.cluster_name}-alb-ingress-controller"

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
            "${var.oidc_url}:sub" : "system:serviceaccount:${var.namespace}:alb-ingress-controller",
            "${var.oidc_url}:aud" : "sts.amazonaws.com"
          }
        }
      }
    ]
  })
}

# IAM Policy for ALB Ingress Controller
resource "aws_iam_role_policy" "alb_ingress_controller_policy" {
  #checkov:skip=CKV_AWS_290
  #checkov:skip=CKV_AWS_355
  name   = "${var.cluster_name}-alb-ingress-controller-policy"
  role   = aws_iam_role.alb_ingress_controller.name
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = [
        "ec2:DescribeSubnets",
        "ec2:DescribeSecurityGroups",
        "ec2:DescribeInstances",
        "ec2:DescribeNetworkInterfaces",
        "ec2:CreateTags",
        "ec2:DeleteTags",
        "elasticloadbalancing:*",
        "iam:ListServerCertificates",
        "iam:GetServerCertificate",
        "cognito-idp:DescribeUserPoolClient",
        "waf-regional:GetWebACL",
        "acm:ListCertificates",
        "acm:DescribeCertificate",
        "iam:CreateServiceLinkedRole",
        "iam:GetServerCertificate",
        "waf:GetWebACLForResource",
        "waf:AssociateWebACL",
        "waf:DisassociateWebACL",
        "shield:GetSubscriptionState",
        "shield:DescribeProtection",
        "shield:CreateProtection",
        "shield:DeleteProtection",
      ]
      Effect   = "Allow"
      Resource = "*"
    }]
  })
}

# Helm Release for AWS ALB Ingress Controller
resource "helm_release" "alb_ingress_controller" {
  name       = "aws-alb-ingress-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = var.namespace

  set {
    name  = "clusterName"
    value = var.cluster_name
  }

  set {
    name  = "region"
    value = var.region
  }

  set {
    name  = "vpcId"
    value = var.vpc_id
  }

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.name"
    value = "alb-ingress-controller"
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.alb_ingress_controller.arn
  }
}
