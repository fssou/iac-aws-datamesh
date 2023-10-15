
# Create S3 bucket for raw data
resource "aws_s3_bucket" "data" {
  bucket = "sor.data.francl.in"
  tags = {
    Environment = "datamesh"
    Data_Type   = "sor"
    Name        = "sor.data.francl.in"
  }
}
