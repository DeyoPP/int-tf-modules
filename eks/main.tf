module "eks" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-eks?ref=5fe865e860c4cc8506c639f2e63bc25e21a31b37"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id                    = var.vpc_id
  subnet_ids                = var.subnet_ids
  cluster_service_ipv4_cidr = var.cluster_service_ipv4_cidr

  manage_aws_auth_configmap = true
  aws_auth_roles            = var.aws_auth_roles
  aws_auth_users            = var.aws_auth_users
  aws_auth_accounts         = var.aws_auth_accounts

  cloudwatch_log_group_retention_in_days = var.cloudwatch_log_group_retention_in_days
  cluster_enabled_log_types              = var.cluster_enabled_log_types

  cluster_endpoint_public_access = true
  enable_irsa                    = true

  node_security_group_additional_rules = merge({
    ingress_self_all = {
      description = "Node to node all ports/protocols"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      type        = "ingress"
      self        = true
    }
    egress_all = {
      description      = "Node all egress"
      protocol         = "-1"
      from_port        = 0
      to_port          = 0
      type             = "egress"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }, var.node_additional_security_group_rules)

  create_iam_role          = var.create_iam_role
  iam_role_use_name_prefix = var.create_iam_role
  iam_role_arn             = var.create_iam_role ? null : var.iam_role_arn

  cluster_addons = {
    ebs-csi = {
      name                     = "aws-ebs-csi-driver"
      addon_version            = var.ebs_csi_version
      service_account_role_arn = var.ebs_csi_irsa_role_arn
      resolve_conflicts        = "OVERWRITE"
    }
    vpc-cni = {
      most_recent              = true
      addon_version            = var.vpc_cni_version
      before_compute           = true
      service_account_role_arn = var.vpc_cni_irsa_role_arn
      resolve_conflicts        = "OVERWRITE"
      configuration_values = jsonencode({
        env = {
          ENABLE_PREFIX_DELEGATION = "true"
          WARM_PREFIX_TARGET       = "1"
        }
      })
    }
    kube-proxy = {
      most_recent       = true
      addon_version     = var.kube_proxy_version
      resolve_conflicts = "OVERWRITE"
    }
    coredns = {
      most_recent       = true
      addon_version     = var.coredns_version
      resolve_conflicts = "OVERWRITE"
    }
  }
}