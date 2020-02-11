---
title: "AWS API Gateway with Lambda Integration"
date: 2020-02-05T16:11:06+08:00
draft: false
---

## Goal

- Demonstrate how to integrate AWS Lambda with API Gateway

## Pre-reqs

- AWS account and proper permissions through IAM
  
## Build a Lambda function

- Log on AWS Web Console
- Services -> Lambda -> Create function
  - Function name: Lambda-API-Gateway-Demo
  - Runtime: Node.js 12.x
  - Permissions: Create a new role with basic Lambda permissions
  - Click Create function button

- Function code
  - Code entry type: Edit code inline (other options: Upload a .zip file; Upload from S3)
  - Runtime: Node.js 12.x
  - Handler: index.handler
  - index.js

  ``` javascript

  exports.handler = async (event) => {
    // TODO implement
    const response = {
        statusCode: 200,
        body: JSON.stringify('Hello from Lambda!'),
    };
    return response;
  };

  ```

## Testing

- Configure test event
  - Create new test event
  - Event template: Hello World
  - Event name: LambdaDemo
  - Keep the rest as default
  - Click Test button to test
  - Log output

  ``` JSON

  {
    "statusCode": 200,
    "body": "\"Hello from Lambda!\""
  }

  ```

  ``` Bash

  START RequestId: 30020ce5-86be-47d1-ba61-ef08393f9dc7 Version: $LATEST
  END RequestId: 30020ce5-86be-47d1-ba61-ef08393f9dc7
  REPORT RequestId: 30020ce5-86be-47d1-ba61-ef08393f9dc7	Duration: 2.99 ms	Billed Duration: 100 ms	Memory Size: 128 MB	Max Memory Used: 64 MB	Init Duration: 423.93 ms

  ```

- Add trigger
  - Go to Designer UI of the function
  - Add trigger
    - Trigger configuration: API Gateway (other options: AWS IoT, Application Load Balancer, CloudWatch Events, CloudWatch Logs, DynamoDB, Kinesis, S3, SNS, SQS)
    - API: Create a new API
    - Security: Open (for testing purpose, not for production)
    - Click Add button
  - API Gateway looks like:

  ``` Bash

  Lambda-API-Gateway-Demo-API
  arn:aws-cn:execute-api:cn-northwest-1:005464510748:5uac1lg2va/*/*/Lambda-API-Gateway-Demo
  API: api-gateway/5uac1lg2va/*/*/Lambda-API-Gateway-DemoAPI endpoint: https://5uac1lg2va.execute-api.cn-northwest-1.amazonaws.com.cn/default/Lambda-API-Gateway-Demo API name: Lambda-API-Gateway-Demo-API

  ```

- Validate the integration

  - Open the link https://5uac1lg2va.execute-api.cn-northwest-1.amazonaws.com.cn/default/Lambda-API-Gateway-Demo on browser
    - "Hello from Lambda!" would be displayed

## Conclusion

We achieved our goal successfully: AWS Lambda integration with API Gateway

- What we've done
  - Created Lambda function
  - Created API Gateway and added it as the Trigger of Lambda function
  - Validation