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

resource "helm_release" "karpenter" {
  namespace           = var.karpenter_namespace
  name                = "karpenter"
  repository          = "oci://public.ecr.aws/karpenter"
  repository_username = var.ecr_repo_username
  repository_password = var.ecr_repo_password
  chart               = "karpenter"
  version             = var.karpenter_version
  wait                = false

  values = [
    <<-EOT
    serviceAccount:
      name: ${module.karpenter.service_account}
    settings:
      clusterName: ${var.cluster_name}
      clusterEndpoint: ${var.cluster_endpoint}
      interruptionQueue: ${module.karpenter.queue_name}
    EOT
  ]
}

resource "kubectl_manifest" "karpenter_node_class" {

  yaml_body = <<-YAML
    apiVersion: karpenter.k8s.aws/v1beta1
    kind: EC2NodeClass
    metadata:
      name: default
    spec:
      amiFamily: AL2023
      role: ${module.karpenter.node_iam_role_name}
      subnetSelectorTerms:
        - tags:
            karpenter.sh/discovery: ${var.cluster_name}
      securityGroupSelectorTerms:
        - tags:
            karpenter.sh/discovery: ${var.cluster_name}
      tags:
        karpenter.sh/discovery: ${var.cluster_name}
  YAML

  depends_on = [
    helm_release.karpenter
  ]
}


resource "kubectl_manifest" "karpenter_node_pool" {
  yaml_body = file(var.karpenter_node_pool_config)

  depends_on = [
    kubectl_manifest.karpenter_node_class
  ]
}
