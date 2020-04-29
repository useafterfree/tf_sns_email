variable "additional_tags" {
  default     = {}
  description = "The tags to apply to resources created by this module"
  type        = map(string)
}

variable "topic_name" {
  type        = string
  description = "SNS Topic name. Must be unique."
  default     = "EmailSNSTopic"
}

variable "display_name" {
  type        = string
  description = "Name shown in confirmation emails"
  default     = "tf_sns_email"
}

variable "emails" {
  type        = list(string)
  description = "Email addresses to send notifications to"
  default     = ["a@a.com"]
}

variable "owner" {
  type        = string
  description = "Sets the owner tag on the CloudFormation stack"
  default     = "tf_sns_email"
}

variable "protocol" {
  default     = "email"
  description = "SNS Protocol to use. email or email-json"
  type        = string
}

variable "stack_name" {
  type        = string
  description = "Cloudformation stack name that wraps the SNS topic. Must be unique."
  default     = "tf-sns-email"
}
