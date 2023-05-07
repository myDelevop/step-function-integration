{
    "Comment": "A Service integrations demonstrations",
    "StartAt": "Write to DynamoDB",
    "States": {
      "Write to DynamoDB": {
        "Type": "Pass",
        "Result": {
            "data1": 0.5,
            "data2": 1.5
        },
        "ResultPath": "$.result",
        "Next": "Send to SQS"
      },
      "Send to SQS": {
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
