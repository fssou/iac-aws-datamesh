
resource "aws_s3_bucket" "data" {
  bucket = "raw.data.francl.in"
  tags = {
    Environment = "datamesh"
    Data_Type   = "raw"
    Name        = "raw.data.francl.in"
  }
}
