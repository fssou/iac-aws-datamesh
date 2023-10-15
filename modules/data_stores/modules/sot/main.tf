
# Create S3 bucket for sot data
resource "aws_s3_bucket" "data" {
  bucket = "sot.data.francl.in"
  tags = {
    Environment = "datamesh"
    Data_Type   = "sot"
    Name        = "sot.data.francl.in"
  }
}
