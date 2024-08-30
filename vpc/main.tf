locals {
  region = var.region
}

module "vpc" {
  #checkov:skip=CKV_TF_1: "No need to use commit hash, easier to track with version"
  #chekcov:skip=CKV2_AWS_57
  #chekcov:skip=CKV_AWS_149
  #chekcov:skip=CKV2_AWS_64
  source  = "git::https://github.com/terraform-aws-modules/terraform-aws-vpc?ref=2e417ad0ce830893127476436179ef483485ae84"

  name = var.vpc_name
  cidr = var.cidr

  azs                           = ["${local.region}a", "${local.region}b", "${local.region}c"]
  private_subnets               = var.private_subnets
  private_subnet_tags           = var.private_subnet_tags
  public_subnets                = var.public_subnets
  public_subnet_tags            = var.public_subnet_tags  
  database_subnets              = var.database_subnets
  database_subnet_tags          = var.database_subnet_tags  
  manage_default_network_acl    = false
  manage_default_route_table    = false
  manage_default_security_group = false
  map_public_ip_on_launch       = true

  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = false

  create_database_subnet_route_table = true
  create_database_subnet_group       = false

  enable_flow_log                      = true
  create_flow_log_cloudwatch_log_group = true
  create_flow_log_cloudwatch_iam_role  = true
  flow_log_max_aggregation_interval    = 60
  vpc_flow_log_tags = {
    Name = "${var.vpc_name}-all-traffic"
  }

  # required for service discovery
  enable_dns_hostnames = true
  enable_dns_support   = true
}