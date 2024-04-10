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

variable "image_name" {
  type = string
  default = "jher-io-container"
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