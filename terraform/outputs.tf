output "apigatewayv2_api_api_endpoint" {
  description = "The URI of the API"
  value = try(aws_apigatewayv2_api.lambda-api.api_endpoint, "")
}

output "aws_cloudfront_distribution" {
  description = "The Cloudfront URL"
  value = try(aws_cloudfront_distribution.cloudfront_distributon.domain_name, "")
}