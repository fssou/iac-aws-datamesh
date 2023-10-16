
resource "aws_s3_bucket" "data" {
  bucket = "athena-query-results.data.francl.in"
  tags = {
    Environment = "datamesh"
    Data_Type   = "athena"
    Name        = "athena-query-results.data.francl.in"
  }
}
