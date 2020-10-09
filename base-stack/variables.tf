variable "domain_name" {
  description = "Name use for DNS and S3 bucket configuration"
  type = string
}

variable "region" {
  description = "AWS Region"
  default     = "eu-west-2"
  type = string
}