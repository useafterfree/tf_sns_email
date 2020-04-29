## Locals

locals {
  default_tags = {
    "Terraform"        = "true"
    "Terraform-Module" = "deanwilson-sns-email"
  }
  emails = [for index, x in var.emails : {
    Endpoint = var.emails[index]
    Protocol = var.protocol
  }]
}

data "template_file" "cloudformation_sns_stack" {
  template = file("${path.module}/templates/email-sns-stack.json.tpl")

  vars = {
    display_name = var.display_name
    emails       = jsonencode(local.emails)
    topic_name   = var.topic_name
  }
}

resource "aws_cloudformation_stack" "sns-topic" {
  name          = var.stack_name
  template_body = data.template_file.cloudformation_sns_stack.rendered

  tags = merge(
    local.default_tags,
    var.additional_tags,
    {
      "Name" = var.stack_name
    },
  )
}
