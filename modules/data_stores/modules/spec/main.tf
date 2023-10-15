
# Create S3 bucket for spec data
resource "aws_s3_bucket" "data" {
  bucket = "spec.data.francl.in"
  tags = {
    Environment = "datamesh"
    Data_Type   = "spec"
    Name        = "spec.data.francl.in"
  }
}
