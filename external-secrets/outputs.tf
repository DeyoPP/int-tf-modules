output "kubernetes_secret_name" {
  value = kubernetes_secret.external.metadata[0].name
}
