variable "source_bucket_name" {
  description = "The name of the source bucket"
  type        = string
}

variable "destination_bucket_name" {
  description = "The name of the destination bucket"
  type        = string
}

variable "environment" {
  description = "The environment for the buckets (e.g., dev, prod)"
  type        = string
}

variable "replication_role_name" {
  description = "Name of the replication IAM role"
  type        = string
}