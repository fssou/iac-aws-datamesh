
# Create S3 bucket for spec data
resource "aws_s3_bucket" "data" {
  bucket = "spec.data.francl.in"
  tags = {
    Environment = "datamesh"
    Data_Type   = "spec"
    Name        = "spec.data.francl.in"
  }
}

# Create S3 bucket acl private
resource "aws_s3_bucket_acl" "data" {
  bucket = aws_s3_bucket.data.id
  acl    = "private"
}
