provider "aws" {
  region = "us-east-1"
  access_key = "AKIAU6URLWG53QDJDTUA"
  secret_key = "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"
}
resource "aws_s3_bucket" "b" {
  bucket = "my-ahmedtf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}