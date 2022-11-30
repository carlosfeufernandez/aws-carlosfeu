output "website_endpoint" {
  description = "The website endpoint"
  value       = aws_s3_bucket_website_configuration.kc-website.website_endpoint
}