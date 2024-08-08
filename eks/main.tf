module "eks" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-eks?ref=5fe865e860c4cc8506c639f2e63bc25e21a31b37"

  cluster_name    = var.cluster_name
  cluster_version = "1.30"

  # Gives Terraform identity admin access to cluster which will
  # allow deploying resources (Karpenter) into the cluster
  enable_cluster_creator_admin_permissions = var.enable_cluster_creator_admin_permissions
  cluster_endpoint_public_access           = var.cluster_endpoint_public_access

  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  vpc_id                   = var.vpc_id
  subnet_ids               = var.subnet_ids

  eks_managed_node_groups = {
    karpenter = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.medium"]

      min_size     = 1
      max_size     = 2
      desired_size = 1

      taints = {

        addons = {
          key    = "CriticalAddonsOnly"
          value  = "true"
          effect = "NO_SCHEDULE"
        },
      }
    }
  }
  tags = var.tags
}
