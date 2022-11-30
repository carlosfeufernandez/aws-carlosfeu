resource "aws_s3_bucket" "s3-carlosfeu-kc" {
  bucket = "s3-carlosfeu-kc"
}

resource "aws_s3_bucket_acl" "bucket-acl" {
  bucket = "s3-carlosfeu-kc"
  acl    = "public-read"
}

resource "aws_s3_object" "kc-index" {
  bucket = "s3-carlosfeu-kc"
  key    = "index.html"
  source = "files/index.html"
  content_type = "text/html"

}

resource "aws_s3_object" "kc-error" {
  bucket = "s3-carlosfeu-kc"
  key    = "error.html"
  source = "files/error.html"
  content_type = "text/html"

}

resource "aws_s3_object" "kc-fondo" {
  bucket = "s3-carlosfeu-kc"
  key    = "fondo.jpg"
  source = "images/fondo.jpg"

}

resource "aws_s3_bucket_policy" "kc-policy" {
  bucket = "s3-carlosfeu-kc"
  policy = file("policy/policy.json")

}

resource "aws_s3_bucket_website_configuration" "kc-website" {
  bucket = "s3-carlosfeu-kc"

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}