output "s3_bucket_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = module.bucket.s3_bucket_arn
}

output "s3_bucket_id" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = module.bucket.s3_bucket_id
}