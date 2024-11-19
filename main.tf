provider "aws" {
  region = "eu-west-3"
}

module "s3_buckets" {
  source                = "./s3buckets"          # Path to the S3 buckets module
  source_bucket_name    = var.source_bucket_name # Pass variables to the module
  destination_bucket_name = var.destination_bucket_name
  environment           = var.environment        # Environment variable
  replication_role_name = var.replication_role_name
}