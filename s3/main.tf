module "meta" {
  source = "../meta"
  meta   = var.meta
}

module "bucket_name" {
  source  = "github.com/terraform-aws-modules/terraform-aws-s3-bucket?ref=8a0b697"
  version = "3.3.0"



  bucket = var.bucket_name == "" ? module.meta.name : var.bucket_name
  acl    = var.acl
  versioning = {
    enabled = var.versioning_enabled
  }
  force_destroy            = var.force_destroy
  control_object_ownership = var.control_object_ownership
  object_ownership         = var.object_ownership
  attach_policy            = var.attach_policy
  website                  = var.website
  cors_rule                = jsonencode(var.cors_rule)
  policy                   = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowPublicRead",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${module.meta.name}/*"
        }
    ]
}
EOF
}