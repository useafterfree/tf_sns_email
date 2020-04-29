{
  "AWSTemplateFormatVersion": "2010-09-09",

  "Resources" : {
    "${topic_name}": {
      "Type" : "AWS::SNS::Topic",
      "Properties" : {
        "DisplayName" : "${display_name}",
        "Subscription": ${emails}
      }
    }
  },

  "Outputs" : {
    "ARN" : {
      "Description" : "Email SNS Topic ARN",
      "Value" : { "Ref" : "${topic_name}" }
    }
  }
}
