variable "source_bucket_name" {
  description = "The name of the source S3 bucket"
  type        = string
}

variable "destination_bucket_name" {
  description = "The name of the destination S3 bucket"
  type        = string
}

variable "environment" {
  description = "The deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "replication_role_name" {
  description = "Name of the replication IAM role"
  type        = string
  default     = "s3-replication-role"
}