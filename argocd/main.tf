data "aws_secretsmanager_secret_version" "my_secret" {
  secret_id = "github-credentials-deyo"
}

locals {
  secret_json = jsondecode(data.aws_secretsmanager_secret_version.my_secret.secret_string)
}

resource "helm_release" "argocd" {
  namespace        = var.namespace
  create_namespace = true
  name             = var.release_name
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = var.argocd_chart_version

  timeout = var.timeout_seconds

  values = [templatefile("${path.root}/values.yaml", {
    argocd_admin_password = var.admin_password == "" ? "" : bcrypt(var.admin_password),
    insecure              = var.insecure == false ? false : true,
    enable_dex            = var.enable_dex == true ? true : false,
    github_username       = local.secret_json["username"],
    github_password       = local.secret_json["password"]
  })]
}
