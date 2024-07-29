data "tls_certificate" "github" {
  url = var.github_url
}

resource "aws_iam_openid_connect_provider" "github" {
  url             = var.github_url
  client_id_list  = var.client_id_list
  thumbprint_list = concat(["${data.tls_certificate.github.certificates.0.sha1_fingerprint}"], var.thumbprint)
}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "assume-role-policy" {
  for_each = var.role_map

  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com"]
    }
    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = [var.role_map[each.key].repository]
    }
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }
  }
}


resource "aws_iam_role" "github_ci" {
  for_each = var.role_map
  path     = "/${module.meta.name}/"

  name                = each.key
  assume_role_policy  = data.aws_iam_policy_document.assume-role-policy[each.key].json
  managed_policy_arns = var.role_map[each.key].managed_policy_arns

  max_session_duration = var.max_session_duration
}