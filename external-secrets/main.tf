
data "aws_secretsmanager_secret" "example" {
  name = var.secret_name
}

data "aws_secretsmanager_secret_version" "example" {
  secret_id = data.aws_secretsmanager_secret.example.id
}

locals {
  secret_data = jsondecode(data.aws_secretsmanager_secret_version.example.secret_string)
}

resource "kubernetes_secret" "external" {
  metadata {
    name      = var.secret_name
    namespace = var.namespace
  }

  data = {
    db_host     = local.secret_data["host"]
    db_port     = local.secret_data["port"]
    db_name     = local.secret_data["db_name"]
    db_user     = local.secret_data["username"]
    db_password = local.secret_data["password"]
  }
}
