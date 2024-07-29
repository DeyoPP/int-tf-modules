module "ecr" {
  source                            = "git::https://github.com/terraform-aws-modules/terraform-aws-ecr?ref=df965a8501c9256c1893bb9d65fc2c037ffa1257"
  for_each                          = toset(var.repository_names)
  repository_name                   = each.key
  repository_read_write_access_arns = var.repository_read_write_access_arns
  repository_image_tag_mutability   = "MUTABLE"
  repository_lifecycle_policy = jsonencode({
    rules = var.rules
  })

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}