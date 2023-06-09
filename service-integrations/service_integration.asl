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
        "Type": "Task",
        "Resource": "arn:aws:states:::sqs:sendMessage",
        "Parameters": {
          "QueueUrl": "https://sqs.eu-west-1.amazonaws.com/394070527653/service-integration-queue",
          "MessageBody.$": "$.DynamoDB"
        },
        "ResultPath": "$.SQS",
        "Next": "Publish to SNS"
      },


      "Publish to SNS": {
        "Type": "Task",
        "Resource": "arn:aws:states:::sns:publish",
        "Parameters": {
          "TopicArn": "arn:aws:sns:eu-west-1:394070527653:service-integration-topic",
          "Message": {
            "Input": "Hello from Step Functions!"
          }
        },
        "End": true
      }
    }
}
