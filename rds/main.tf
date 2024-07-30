module "db" {
  #chekcov:skip=CKV2_AWS_57
  #chekcov:skip=CKV_AWS_64
  source = "git::https://github.com/terraform-aws-modules/rds//modules/db_instance?ref=a4ae4a51545f5cb617d30b716f6bf11840c76a0e" 

  identifier = module.meta.name

  engine                      = "postgres"
  engine_version              = "14"
  instance_class              = "db.t3.micro"
  allocated_storage           = 5
  db_name                     = "postgres"
  username                    = "deyo"
  manage_master_user_password = false
  password                    = random_password.master_password.result
  port                        = "5432"

  iam_database_authentication_enabled = true

  deletion_protection = var.deletion_protection

  vpc_security_group_ids = [module.security_group.security_group_id]

  maintenance_window      = "Mon:00:00-Mon:03:00"
  backup_window           = "03:00-06:00"
  backup_retention_period = 7

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = var.subnet_ids

  # DB parameter group
  family = "postgres14"

  # DB option group
  major_engine_version = "14"

  parameters = var.parameters

  options = var.options
}


module "security_group" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-security-group?ref=20e107f1658bc5c8b23efce2e17406e74e6cbeae" 

  name        = module.meta.name
  description = "Security group for PostgreSQL"
  vpc_id      = var.vpc_id


  ingress_with_cidr_blocks = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      description = "PostgreSQL access from within VPC"
      cidr_blocks = var.cidr_block
    },
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      description = "PostgreSQL access from within VPC"
      cidr_blocks = var.additional_cidr_block
    }
  ]

  tags = {
    Owner       = module.meta.labels.basename
    Environment = module.meta.labels.suffix
  }

}

resource "aws_kms_key" "db_key" {
  description             = "KMS key for AWS Secrets Manager"
  deletion_window_in_days = 7
  enable_key_rotation     = true
}

resource "aws_secretsmanager_secret" "password_secret" {
  name                    = module.meta.name
  recovery_window_in_days = 30
  kms_key_id              = aws_kms_key.db_key.id
}

resource "random_password" "master_password" {
  length  = 16
  special = var.password_special
}

resource "aws_secretsmanager_secret_version" "password_secret_value" {
  secret_id     = aws_secretsmanager_secret.password_secret.id
  secret_string = random_password.master_password.result
}