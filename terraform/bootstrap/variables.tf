variable "region" {
  description = "The region where AWS operations will take place."
  type        = string
  default     = "eu-west-2" // Set this to your desired default region
}

variable "environment" {
  description = "The environment for the infrastructure deployment."
  type        = string
  default     = ""
}

variable "domain_name" {
  description = "The domain name for the Route53 zone."
  type        = string
  default     = ""
}

variable "project_name" {
  description = "The name of the project."
  type        = string
  default     = ""
}

variable "image_name" {
  description = "The name of the Docker image for the ECR repository."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to be applied to resources that support tagging."
  type = object({
    Name       = string
    Env        = string
    Controller = string
  })
  default = {
    Name       = ""
    Env        = ""
    Controller = "Managed by Terraform"
  }
}