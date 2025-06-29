provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_public_access_block" "bucket_block" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = "cs5-instance"
  }

  user_data = file("${path.module}/../scripts/bootstrap.sh")
}

output "ec2_instance_id" {
  value = aws_instance.ec2.id
}
