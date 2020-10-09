# Infrastructure Stacks

This repo currently contains 1 stack which is a work in progress:

* base-stack

Each service that is deployed should have its own tf file e.g. s3_static_site.tf and so on...

### tfvars

Each stack has a **tfvars** folder and each environment should have a **tfvarsfile** e.g. **dev.tfvars**

## Requirements

* An AWS account and your credentials (`aws_access_key_id` and `aws_secret_access_key`) configured.

## Example Module Usage

```HCL
module "s3_static_site" {
  source             = "git@github.com:matthewtowen/terraform_modules.git//s3_static_site"
  domain_name        = var.domain_name
}