
# Create S3 bucket for sot data
resource "aws_s3_bucket" "data" {
  bucket = "sot.data.francl.in"
  tags = {
    Environment = "datamesh"
    Data_Type   = "sot"
    Name        = "sot.data.francl.in"
  }
}

# Create S3 bucket acl private
resource "aws_s3_bucket_acl" "data" {
  bucket = aws_s3_bucket.data.id
  acl    = "private"
}
