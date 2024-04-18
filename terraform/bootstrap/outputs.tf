output "aws_route53_zone" {
  description = "Route 53 Hosted Zone ID"
  value       = aws_route53_zone.main.zone_id
}

output "aws_s3_bucket" {
  description = "State File S3 Bucket Name"
  value       = aws_s3_bucket.state-file-bucket.bucket
}

output "aws_ecr_repository" {
  description = "ECR Repository URL"
  value       = aws_ecr_repository.ecr-repository.repository_url
}