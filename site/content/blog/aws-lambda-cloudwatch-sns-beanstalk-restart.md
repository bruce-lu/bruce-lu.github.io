---
title: "AWS Lambda together with CloudWatch and SNS to restart Beanstalk app server as needed"
date: 2020-01-18T16:11:06+08:00
draft: false
---

## Goal

- Restart Elastic Beanstalk app server automatically when needed
In one of my IoT applications built with Elastic Beanstalk, we wanted to restart the beanstalk app server 
when there is no log activity occurred for a period of time. There is no such kind of built-in alarm-action feature in CloudWatch.
My solution here is to demonstrate how to do this in Lambda, collaborating with other AWS services such as CloudWatch, SNS etc..

## Pre-reqs

- AWS account and proper permissions through IAM
  
## Create SNS to receive log activities alarm notification

- Go to AWS Web Console
Services -> SNS -> Create a new SNS and email subscription

## Create CloudWatch logging alarm based on log activities

- Go to AWS Web Console
CloudWatch -> Alarms -> Create Alarm -> Select Metrics -> Logs (my app logs) -> IncomingBytes -> Select
  - Metrics name: IncomingBytes
  - LogGroupName: My app's loggroup
  - Statistic: Sum
  - Period: 15 minutes
  - Threshold type: Static
  - Whenever IncomingBytes is...: Lower
  - than: 1
  - Next
  - Select SNS topic to notify(We just created)
  - (Note: There is no EC2/Beanstal restart action for Logs metrics, so we'd use Lambda later on)
  - Next
  - Give it a name and save

## Create Lambda to take action when no log activity reported by CloudWatch

- Create Lambda
  - Go to AWS Web Console
  - Create function
  - Author from scratch
  - Function name: Give it a name
  - Runtime: Python 3.8
  - Permissions: Create a new role with basic Lambda permissions

- Function code
  - Handler: index.handler_restart_app_server
  - index.py
    ``` Python
    import json
    import boto3

    ebc = boto3.client('elasticbeanstalk')

    def handler_restart_app_server(event, context):
        response = ebc.restart_app_server(
          EnvironmentId='your-eb-env-id',
          EnvironmentName='your-eb-env-name'
        )
        print(response)
        
        return {
              'statusCode': 200,
              'body': response
        }
      
    def handler_request_log_100_lines(event, context):
        response = ebc.request_environment_info(
        EnvironmentName='your-env-name',
        #InfoType='tail'|'bundle'
        InfoType='tail'
        )
        print('---->')
        print(response)
        print('<----')
        return {
            'statusCode': 200,
            'body': json.dumps(response)
        }
    ```

## Add Lambda Trigger

The purpose is to trigger our Lambda function whenever we got no log actitiy notification in our SNS topic

- Go to AWS Lambda function console
- Go to designer
- Add trigger: Select SNS topic we created

## Testing

Just watch for the notification from our topic. Every time we get notification the Elastic Beanstalk app server would be restarted

## Conclusion

We achived our goal to restart EB app server when no log activity reported by CloudWatch.

- What we've done
  - Created SNS topic to receive notification from CloudWatch Alarm
  - Created Alarm in CloudWatch to monitor log metrics
  - Created Lambda function to handle SNS notification event