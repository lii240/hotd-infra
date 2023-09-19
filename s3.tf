resource "aws_s3_bucket" "hotd" {
  bucket = var.bucketName

  tags = {
    Name        = "HOTD static website"
    Environment = "Dev"
    Creator     = "LH"
  }
}

#s3 static website configuration
resource "aws_s3_bucket_website_configuration" "hotd_config" {
  bucket = aws_s3_bucket.hotd.id

  index_document {
    suffix = "index.html"
  }
}

#bucket policy to give read access to public
resource "aws_s3_bucket_policy" "hotd_bucket_policy" {
  bucket = aws_s3_bucket.hotd.id
  policy = data.aws_iam_policy_document.hotd_allow_public_access.json
}

data "aws_iam_policy_document" "hotd_allow_public_access" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [aws_s3_bucket.hotd.arn, "${aws_s3_bucket.hotd.arn}/*",]
  }
}