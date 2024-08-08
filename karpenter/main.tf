module "karpenter" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-eks//modules/karpenter?ref=5fe865e860c4cc8506c639f2e63bc25e21a31b37"
  
  cluster_name = var.cluster_name

  enable_pod_identity             = true
  create_pod_identity_association = true

  node_iam_role_additional_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    AmazonEKSWorkerNodePolicy = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    AmazonEC2FullAccess = "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    AmazonEKS_CNI_Policy = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    AmazonEKSClusterPolicy = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  }

  tags = var.tags
}