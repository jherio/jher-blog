# Define local variables
locals {
  # Construct the bucket name using the account ID, region, and project name
  bucket_name = "${data.aws_caller_identity.current.account_id}-${data.aws_region.current.name}-${var.project_name}-state-file"
}

# Create a Route53 zone
resource "aws_route53_zone" "main" {
  # Set the domain name for the zone
  name = var.domain_name
  # Add tags to the zone, including a description
  tags = merge(var.tags, { "Description" = "Route53 zone for ${var.domain_name}" })
}

# Create an S3 bucket for storing the Terraform state file
resource "aws_s3_bucket" "state-file-bucket" {
  # Use the locally defined bucket name
  bucket = local.bucket_name
  # Add tags to the bucket, including a description
  tags = merge(var.tags, { "Description" = "S3 bucket for Terraform state files" })
}

# Enable versioning for the S3 bucket
resource "aws_s3_bucket_versioning" "state-file-bucket-versioning" {
  # Reference the previously created S3 bucket
  bucket = aws_s3_bucket.state-file-bucket.id
  # Enable versioning
  versioning_configuration {
    status = "Enabled"
  }
}

# Create an ECR repository
resource "aws_ecr_repository" "ecr-repository" {
  # Set the name of the repository to the image name
  name = var.image_name
  # Set image tags to be immutable to prevent overwriting
  image_tag_mutability = "IMMUTABLE"
  # Add tags to the repository, including a description
  tags = merge(var.tags, { "Description" = "ECR repository for ${var.image_name}" })
}
