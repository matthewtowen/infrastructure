module "s3_static_site" {
  source             = "git@github.com:matthewtowen/terraform_modules.git//s3_static_site?ref=v0.1"
  domain_name        = var.domain_name
}
