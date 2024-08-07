module "eks" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-eks?ref=5fe865e860c4cc8506c639f2e63bc25e21a31b37"

  cluster_name    = var.name
  cluster_version = var.cluster_version

  # Gives Terraform identity admin access to cluster which will
  # allow deploying resources (Karpenter) into the cluster
  enable_cluster_creator_admin_permissions = true
  cluster_endpoint_public_access           = true

  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  vpc_id                   = var.vpc_id
  subnet_ids               = var.private_subnets
  control_plane_subnet_ids = var.intra_subnets

  eks_managed_node_groups = {
    karpenter = {
      ami_type       = var.ami_type
      instance_types = split(",", var.instance_types)  # Convert comma-separated string to list

      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_size

      taints = {
        addons = {
          key    = var.taint_key
          value  = var.taint_value
          effect = var.taint_effect
        },
      }
    }
  }

#   node_security_group_tags = merge(var.tags, {
#     "karpenter.sh/discovery" = var.name
#   })

  tags = var.tags
}
