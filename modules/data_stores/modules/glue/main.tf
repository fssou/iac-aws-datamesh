
resource "aws_s3_bucket" "data" {
  bucket = "aws-glue-assets.data.francl.in"
  tags = {
    Environment = "datamesh"
    Data_Type   = "aws-glue-assets"
    Name        = "aws-glue-assets.data.francl.in"
  }
}
