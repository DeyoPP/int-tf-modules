module "argocd" {
  source = "git::https://github.com/aigisuk/terraform-kubernetes-argocd?ref=2a9e1b910ba653f944a5a525029d0b7d648e413f"

  release_name         = var.release_name
  namespace            = var.namespace
  argocd_chart_version = var.argocd_chart_version
  timeout_seconds      = var.timeout_seconds
  admin_password       = var.admin_password
  values_file          = var.values_file
  enable_dex           = var.enable_dex
  insecure             = var.insecure
}