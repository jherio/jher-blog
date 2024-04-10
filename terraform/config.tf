terraform {
  required_version = ">= 1.2.1"

  backend "s3" {
    bucket = "656980178089-eu-west-2-jher-io-state-file"
    key = "terraform/jher-io.tfstate"
    region = "eu-west-2"
    encrypt = true
  }
}