# SNS Email Topic Terraform Module #

## Introduction

Although Terraform supports most of the AWS SNS resource options you'll need
sometimes you'll want to set up a notification topic that uses the email or
email-json protocols. When using either of those an email is sent to the given
address that needs to be confirmed out of bounds, which isn't really the model
that Terraform wants, or should, support.

This thin wrapper module creates an SNS email topic using a tiny CloudFormation
stack and exposes the topics ARN back to, and through, Terraform

## Usage

Use the module in your terraform files:

    module "admin-sns-email-topic" {
      source = "github.com/deanwilson/tf_sns_email"

      display_name  = "Example.org Admin Notifications"
      email_address = "admin@example.org"
      owner         = "Example.org:Admin"
      stack_name    = "admin-sns-email"
    }

and then run a `terraform init` to download the module.

Once you've applied it you can check the value with

    terraform output -module=admin-sns-email-topic arn

### Tagging

You can apply additional tags to CloudFormation stack that terraform
creates using the `additional_tags` input when calling the module.

    additional_tags = {
      "RunFrom" = "Jenkins",
      "Level"   = "SENSITIVE"
    }

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_tags | The tags to apply to resources created by this module | `map(string)` | `{}` | no |
| display\_name | Name shown in confirmation emails | `string` | `"tf_sns_email"` | no |
| emails | Email addresses to send notifications to | `list(string)` | <pre>[<br>  "a@a.com"<br>]</pre> | no |
| owner | Sets the owner tag on the CloudFormation stack | `string` | `"tf_sns_email"` | no |
| protocol | SNS Protocol to use. email or email-json | `string` | `"email"` | no |
| stack\_name | Cloudformation stack name that wraps the SNS topic. Must be unique. | `string` | `"tf-sns-email"` | no |
| topic\_name | SNS Topic name. Must be unique. | `string` | `"EmailSNSTopic"` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | Email SNS topic ARN |
| emails | Email SNS topic ARN |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

### Author

  [Dean Wilson](https://www.unixdaemon.net)
