resource "helm_release" "external_dns" {
  name       = "external-dns"
  repository = "https://kubernetes-sigs.github.io/external-dns/"
  chart      = "external-dns"
  namespace  = "kube-system"

  set {
    name  = "provider"
    value = "aws"
  }

  set {
    name  = "aws.zoneType"
    value = "public"
  }

  set {
    name  = "policy"
    value = "upsert-only"  # Safe option, only updates or creates records
  }

  set {
    name  = "registry"
    value = "txt"
  }

  set {
    name  = "aws.region"
    value = var.region
  }

  set {
    name  = "txtOwnerId"
    value = var.cluster_name
  }
}
