region       = "eu-west-2"
environment  = "dev"
domain_name  = "dev.example.com"
project_name = "my-dev-project"
image_name   = "my-dev-image"
tags = {
  Name       = "my-dev-project"
  Env        = "dev"
  Controller = "Managed by Terraform"
}