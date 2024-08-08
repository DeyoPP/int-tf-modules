resource "aws_iam_role" "karpenter" {
  name = "karpenter-controller"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "karpenter" {
  name = "karpenter-controller-policy"
  role = aws_iam_role.karpenter.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ec2:CreateLaunchTemplate",
          "ec2:DeleteLaunchTemplate",
          "ec2:RunInstances",
          "ec2:TerminateInstances",
          "ec2:DescribeLaunchTemplates",
          "ec2:DescribeInstances",
          "ec2:DescribeInstanceTypes",
          "ec2:DescribeAvailabilityZones",
          "ec2:DescribeSubnets",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeImages"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow",
        Action = [
          "iam:PassRole"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "karpenter" {
  name = "karpenter-instance-profile"
  role = aws_iam_role.karpenter.name
}

resource "kubernetes_manifest" "karpenter_namespace" {
  manifest = {
    apiVersion = "v1"
    kind       = "Namespace"
    metadata = {
      name = "karpenter"
    }
  }
}

resource "kubernetes_manifest" "karpenter_service_account" {
  manifest = {
    apiVersion = "v1"
    kind       = "ServiceAccount"
    metadata = {
      name      = "karpenter"
      namespace = "karpenter"
    }
  }
}

resource "kubernetes_manifest" "karpenter_deployment" {
  manifest = {
    apiVersion = "apps/v1"
    kind       = "Deployment"
    metadata = {
      name      = "karpenter"
      namespace = "karpenter"
    }
    spec = {
      replicas = 1
      selector = {
        matchLabels = {
          app = "karpenter"
        }
      }
      template = {
        metadata = {
          labels = {
            app = "karpenter"
          }
        }
        spec = {
          serviceAccountName = "karpenter"
          containers = [{
            name  = "karpenter"
            image = "public.ecr.aws/karpenter/karpenter:latest"
            args  = [
              "--cluster-name=${var.cluster_name}",
              "--cluster-endpoint=${var.cluster_endpoint}",
              "--aws-region=${var.aws_region}",
              "--aws-instance-profile=${aws_iam_instance_profile.karpenter.name}"
            ]
          }]
        }
      }
    }
  }
}
