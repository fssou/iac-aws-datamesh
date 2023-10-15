
# Create S3 bucket for raw data
resource "aws_s3_bucket" "data" {
  bucket = "sor.data.francl.in"
  tags = {
    Environment = "datamesh"
    Data_Type   = "sor"
    Name        = "sor.data.francl.in"
  }
}

# Create S3 bucket acl private
resource "aws_s3_bucket_acl" "data" {
  bucket = aws_s3_bucket.data.id
  acl    = "private"
}
