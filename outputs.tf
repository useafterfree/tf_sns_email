output "arn" {
  value       = aws_cloudformation_stack.sns-topic.outputs["ARN"]
  description = "Email SNS topic ARN"
}

output "cloudformation_input" {
  value       = data.template_file.cloudformation_sns_stack.rendered
  description = "Email SNS topic ARN"
}
