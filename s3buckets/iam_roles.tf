resource "aws_iam_role" "replication_role" {
  name = var.replication_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "s3.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Policy granting permissions to GetObject from source and PutObject to destination
resource "aws_iam_policy" "replication_policy" {
  name = "s3-replication-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:ListBucket",
          "s3:GetReplicationConfiguration",
          "s3:GetObjectVersionForReplication",
          "s3:GetObjectVersionAcl",
          "s3:GetObjectVersionTagging",
          "s3:GetObjectRetention",
          "s3:GetObjectLegalHold"
        ],
        Resource = [
          "arn:aws:s3:::oikawa-source-bucket",
          "arn:aws:s3:::oikawa-source-bucket/*",
          "arn:aws:s3:::haikyuu-destination-bucket",
          "arn:aws:s3:::haikyuu-destination-bucket/*"
        ]
      },
      {
        Effect = "Allow",
        Action = [
          "s3:ReplicateObject",
          "s3:ReplicateDelete",
          "s3:ReplicateTags",
          "s3:ObjectOwnerOverrideToBucketOwner"
        ],
        Resource = [
          "arn:aws:s3:::oikawa-source-bucket/*",
          "arn:aws:s3:::haikyuu-destination-bucket/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "replication_attachment" {
  role       = aws_iam_role.replication_role.name
  policy_arn = aws_iam_policy.replication_policy.arn
}