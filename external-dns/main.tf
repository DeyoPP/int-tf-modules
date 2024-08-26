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
}
