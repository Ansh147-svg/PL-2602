provider "aws" {
    region = "ap-south-1"
}

resource "aws_s3_bucket" "netflix_bucket" {
  bucket = "dev-netflix-560185625463"

  tags = {
    Name        = "dev-netflix-bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.netflix_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}