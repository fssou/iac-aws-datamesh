
# Create S3 bucket for spec data
resource "aws_s3_bucket" "data" {
  bucket = "spec.data.francl.in"
  tags = {
    Environment = "datamesh"
    Data_Type   = "spec"
    Name        = "spec.data.francl.in"
  }
}


resource "aws_s3_bucket_policy" "data" {
  bucket = aws_s3_bucket.data.id
  policy = data.aws_iam_policy_document.data.json
}

data "aws_iam_policy_document" "data" {
  version = "2012-10-17"
  statement {
    sid = "DenyAll"
    principals {
      type = "*"
      identifiers = [
        "*"
      ]
    }
    actions = [
      "s3:*"
    ]
    effect = "Deny"
    resources = [
      aws_s3_bucket.data.arn,
      "${aws_s3_bucket.data.arn}/*",
    ]
  }
  statement {
    sid = "AllowAllInternal"
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.main.account_id}:root"
      ]
    }
    actions = [
      "s3:*",
    ]
    effect = "Allow"
    resources = [
      aws_s3_bucket.data.arn,
      "${aws_s3_bucket.data.arn}/*",
    ]
  }

}
