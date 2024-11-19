# Enable versioning for the source bucket
resource "aws_s3_bucket_versioning" "source_versioning" {
  bucket = aws_s3_bucket.source_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enable versioning for the destination bucket
resource "aws_s3_bucket_versioning" "destination_versioning" {
  bucket = aws_s3_bucket.destination_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}