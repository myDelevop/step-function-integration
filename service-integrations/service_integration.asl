{
    "Comment": "A Service integrations demonstrations",
    "StartAt": "Write to DynamoDB",
    "States": {
      "Write to DynamoDB": {
        "Type": "Task",
        "Resource": "arn:aws:states:::dynamodb:putItem",
        "Parameters": {
          "TableName": "service-integration-table",
          "Item": {
            "id": {"S.$": "$$.Execution.Id"},
            "Name": {"S": "Rob"},
            "Channel": {"S.$": "$.Channel"}
          }
        },
        "ResultPath": "$.DynamoDB",
        "Next": "Send Message to SQS"


      },
      "Send Message to SQS": {
        "Type": "Pass",
        "Result": {
            "data1": 0.5,
            "data2": 1.5
        },
        "ResultPath": "$.result",
        "Next": "Publish to SNS"
      },
      "Publish to SNS": {
        "Type": "Pass",
        "Result": {
            "data1": 0.5,
            "data2": 1.5
        },
        "ResultPath": "$.result",
        "End": true
      }
    }
}
