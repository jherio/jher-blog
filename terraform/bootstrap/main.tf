resource "aws_route53_zone" "main" {
  name = var.domain_name
  tags = var.tags
}

resource "aws_s3_bucket" "state-file-bucket" {
  bucket = "${data.aws_caller_identity.current.account_id}-${data.aws_region.current.name}-${var.project_name}-state-file"
  tags = var.tags
}

resource "aws_s3_bucket_versioning" "state-file-bucket-versioning" {
  bucket = aws_s3_bucket.state-file-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_ecr_repository" "ecr-repository" {
  name = var.image_name
  image_tag_mutability = "MUTABLE"
  tags = var.tags
}
