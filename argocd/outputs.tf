output "argo_cd_server_url" {
  description = "URL of the ArgoCD server"
  value       = "http://$(kubectl get svc -n ${var.namespace} argocd-server -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')"
}
