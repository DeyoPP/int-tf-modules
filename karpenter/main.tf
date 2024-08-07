module "karpenter" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-eks//modules/karpenter?ref=5fe865e860c4cc8506c639f2e63bc25e21a31b37"

  create                             = var.create
  tags                               = var.tags
  cluster_name                       = var.cluster_name
  create_iam_role                    = var.create_iam_role
  iam_role_name                      = var.iam_role_name
  iam_role_use_name_prefix           = var.iam_role_use_name_prefix
  iam_role_path                      = var.iam_role_path
  iam_role_description               = var.iam_role_description
  iam_role_max_session_duration      = var.iam_role_max_session_duration
  iam_role_permissions_boundary_arn  = var.iam_role_permissions_boundary_arn
  iam_role_tags                      = var.iam_role_tags
  iam_policy_name                    = var.iam_policy_name
  iam_policy_use_name_prefix         = var.iam_policy_use_name_prefix
  iam_policy_path                    = var.iam_policy_path
  iam_policy_description             = var.iam_policy_description
  iam_policy_statements              = var.iam_policy_statements
  iam_role_policies                  = var.iam_role_policies
  ami_id_ssm_parameter_arns          = var.ami_id_ssm_parameter_arns
  enable_pod_identity                = var.enable_pod_identity
  enable_irsa                        = var.enable_irsa
  irsa_oidc_provider_arn             = var.irsa_oidc_provider_arn
  irsa_namespace_service_accounts    = var.irsa_namespace_service_accounts
  irsa_assume_role_condition_test    = var.irsa_assume_role_condition_test
  create_pod_identity_association    = var.create_pod_identity_association
  namespace                          = var.namespace
  service_account                    = var.service_account
  enable_spot_termination            = var.enable_spot_termination
  queue_name                         = var.queue_name
  queue_managed_sse_enabled          = var.queue_managed_sse_enabled
  queue_kms_master_key_id            = var.queue_kms_master_key_id
  queue_kms_data_key_reuse_period_seconds = var.queue_kms_data_key_reuse_period_seconds
  create_node_iam_role               = var.create_node_iam_role
  cluster_ip_family                  = var.cluster_ip_family
  node_iam_role_arn                  = var.node_iam_role_arn
  node_iam_role_name                 = var.node_iam_role_name
  node_iam_role_use_name_prefix      = var.node_iam_role_use_name_prefix
  node_iam_role_path                 = var.node_iam_role_path
  node_iam_role_description          = var.node_iam_role_description
  node_iam_role_max_session_duration = var.node_iam_role_max_session_duration
  node_iam_role_permissions_boundary = var.node_iam_role_permissions_boundary
  node_iam_role_attach_cni_policy    = var.node_iam_role_attach_cni_policy
  node_iam_role_additional_policies  = var.node_iam_role_additional_policies
  node_iam_role_tags                 = var.node_iam_role_tags
  create_access_entry                = var.create_access_entry
  access_entry_type                  = var.access_entry_type
  create_instance_profile            = var.create_instance_profile
  rule_name_prefix                   = var.rule_name_prefix
}
