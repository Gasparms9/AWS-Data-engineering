resource "aws_s3_bucket_replication_configuration" "replication" {
  bucket = aws_s3_bucket.source_bucket.id
  role = aws_iam_role.replication_role.arn

  rule {
    id     = "ReplicateObjects"
    status = "Enabled"
    priority = 1

    destination {
      bucket        = aws_s3_bucket.destination_bucket.arn
      storage_class = "STANDARD"
    }

    delete_marker_replication {
      status = "Disabled" 
    }

    filter {}
  }
}