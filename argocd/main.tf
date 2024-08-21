
resource "helm_repository" "argo_cd" {
  name = "argo-cd"
  url  = var.repository_url
}

resource "helm_release" "argo_cd" {
  name       = "argo-cd"
  repository = helm_repository.argo_cd.name
  chart      = "argo-cd"
  version    = var.argo_cd_chart_version
  namespace  = var.namespace

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "controller.metrics.enabled"
    value = "true"
  }
}
