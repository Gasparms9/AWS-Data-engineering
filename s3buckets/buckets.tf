# Source Bucket
resource "aws_s3_bucket" "source_bucket" {
  bucket = var.source_bucket_name # Name passed as a variable
  force_destroy = true
  tags = {
    Environment = var.environment
    Name        = var.source_bucket_name
  }
}

resource "aws_s3_bucket" "destination_bucket" {
  bucket = var.destination_bucket_name # Name passed as a variable or hardcoded
  force_destroy = true
  tags = {
    Environment = var.environment
    Name        = var.destination_bucket_name
  }
}


# Add a folder to the destination bucket

resource "aws_s3_object" "destination_folder" {
  bucket = aws_s3_bucket.destination_bucket.id
  key    = "haikyuu_best_anime/" # Creates a folder-like object
}