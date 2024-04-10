variable "environment" {
  type = string
  default = "prod"
}

variable "domain_name" {
  type = string
  default = "jher.io"
}

variable "project_name" {
  type = string
  default = "jher-io"
}

variable "cdn_aliases" {
  type        = set(string)
  default     = ["jher.io", "www.jher.io"]
}

variable "domain_zone_id" {
  type = string
  default = "Z0951788VEA2VAF9XBW7"
}

variable "image_name" {
  type = string
  default = "jher-io-container"
}

variable "image_version" {
  type = string
  default = "latest"
}

variable "api_name" {
  type = string
  default = "jher-io-api"
}

variable "lambda_function_name" {
  type = string
  default = "jher-io-function"
}

variable "tags" {
 type = object({
   Name = string
   Env = string
   Controller = string
 })
 description = "Tags for the EC2 instance"
 default = {
   Name = "jher-io"
   Env = "prod"
   Controller = "Managed by Terraform"
 }
}