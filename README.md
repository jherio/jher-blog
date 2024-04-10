# jher.io

This module is a work in progress as I setup a new website. The infrastructure is created on AWS using Terraform and consists of the below:

1. ecr
1. s3
1. lambda
1. api gateway
1. cloudfront
1. certificate manager
1. route53

## Getting Started

### Install Terraform

For version management it is much easier to use tfenv. It can be found at: https://github.com/tfutils/tfenv

```bash
brew install tfenv
tfenv install <required_version>
```

### Bootstrap The Environment

We need to create an S3 bucket for storage of Terraform state files, a route53 hosted zone, and an ECR repository. The output of all 3 will be given once this module is deployed.

```bash
cd terraform/bootstrap
terraform init
terraform plan
terraform apply
```

### Docker Image

Login to ECR

```bash
aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin <bootstrap_ecr_uri>
```

```bash
docker build -t <bootstrap_ecr_uri>/<image_name> . && docker push <bootstrap_ecr_uri>/<image_name>:<image_tag>
```

### Deploy Infrastructure

```bash
cd terraform
terraform init
terraform plan
terraform apply
```
