module "s3_static_site" {
  source             = "git::ssh://git@github.com:matthewtowen/terraform_modules.git"
  domain_name        = "iffleygrove.org"
}
