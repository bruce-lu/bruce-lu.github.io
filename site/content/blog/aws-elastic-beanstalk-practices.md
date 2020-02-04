---
title: "AWS Elastic Beanstalk practices"
date: 2019-11-14T10:18:09+08:00
draft: false
---

## Pre-reqs

- aws-access-id & aws-secret-key are required
  
  Log on AWS console and generate the key

- Download and install EB CLI

  https://docs.amazonaws.cn/console/elasticbeanstalk/eb-cli-install

## Get started with a simple PHP application on EB

- Commands would be used

``` Bash
mkdir zaws-eb-p-blue
cd zaws-eb-p-blue/
ls -ltr
eb init -p PHP # or just eb init without -p, there would be more options
ls
echo "Hello World" > index.html
eb create dev-env
eb open

```

- Commands output reference

``` Bash
admin@~/ws/zaws-eb-p-blue$eb init -p PHP

Select a default region
1) us-east-1 : US East (N. Virginia)
2) us-west-1 : US West (N. California)
3) us-west-2 : US West (Oregon)
4) eu-west-1 : EU (Ireland)
5) eu-central-1 : EU (Frankfurt)
6) ap-south-1 : Asia Pacific (Mumbai)
7) ap-southeast-1 : Asia Pacific (Singapore)
8) ap-southeast-2 : Asia Pacific (Sydney)
9) ap-northeast-1 : Asia Pacific (Tokyo)
10) ap-northeast-2 : Asia Pacific (Seoul)
11) sa-east-1 : South America (Sao Paulo)
12) cn-north-1 : China (Beijing)
13) cn-northwest-1 : China (Ningxia)
14) us-east-2 : US East (Ohio)
15) ca-central-1 : Canada (Central)
16) eu-west-2 : EU (London)
17) eu-west-3 : EU (Paris)
(default is 3): 13
Application zaws-eb-p-blue has been created.
admin@~/ws/aws-elastic-beanstalk-cli-setup/zaws-eb-p-blue$echo "Hello World" > index.html
admin@~/ws/aws-elastic-beanstalk-cli-setup/zaws-eb-p-blue$ls
admin@~/ws/aws-elastic-beanstalk-cli-setup/zaws-eb-p-blue$echo "Hello World" > index.html
admin@~/ws/aws-elastic-beanstalk-cli-setup/zaws-eb-p-blue$eb create dev-env
Creating application version archive "app-191114_102219".
Uploading zaws-eb-p-blue/app-191114_102219.zip to S3. This may take a while.
Upload Complete.
Environment details for: dev-env
  Application name: zaws-eb-p-blue
  Region: cn-northwest-1
  Deployed Version: app-191114_102219
  Environment ID: e-sawuybrtg2
  Platform: arn:aws-cn:elasticbeanstalk:cn-northwest-1::platform/PHP 7.3 running on 64bit Amazon Linux/2.9.0
  Tier: WebServer-Standard-1.0
  CNAME: UNKNOWN
  Updated: 2019-11-14 02:22:24.384000+00:00
Printing Status:
2019-11-14 02:22:23    INFO    createEnvironment is starting.
2019-11-14 02:22:24    INFO    Using elasticbeanstalk-cn-northwest-1-005464510748 as Amazon S3 storage bucket for environment data.
 -- Events -- (safe to Ctrl+C)
2019-11-14 02:22:44    INFO    Created security group named: sg-07c1f2d369b203edb
2019-11-14 02:22:44    INFO    Created load balancer named: awseb-e-s-AWSEBLoa-1W1Z2T64ZALSZ
2019-11-14 02:23:00    INFO    Created security group named: awseb-e-sawuybrtg2-stack-AWSEBSecurityGroup-1DGBM8AL2W9RD
2019-11-14 02:23:01    INFO    Created Auto Scaling launch configuration named: awseb-e-sawuybrtg2-stack-AWSEBAutoScalingLaunchConfiguration-1DZNEYBFGYMF6
2019-11-14 02:23:48    INFO    Created Auto Scaling group named: awseb-e-sawuybrtg2-stack-AWSEBAutoScalingGroup-1VYC4P71PSAT6
2019-11-14 02:23:48    INFO    Waiting for EC2 instances to launch. This may take a few minutes.
2019-11-14 02:24:03    INFO    Created Auto Scaling group policy named: arn:aws-cn:autoscaling:cn-northwest-1:005464510748:scalingPolicy:fd552d69-7117-42c3-a1e5-cd0686f05ccd:autoScalingGroupName/awseb-e-sawuybrtg2-stack-AWSEBAutoScalingGroup-1VYC4P71PSAT6:policyName/awseb-e-sawuybrtg2-stack-AWSEBAutoScalingScaleUpPolicy-18PVQB8L5MBPR
2019-11-14 02:24:03    INFO    Created Auto Scaling group policy named: arn:aws-cn:autoscaling:cn-northwest-1:005464510748:scalingPolicy:b20a5336-7f78-44aa-9075-7b1486996610:autoScalingGroupName/awseb-e-sawuybrtg2-stack-AWSEBAutoScalingGroup-1VYC4P71PSAT6:policyName/awseb-e-sawuybrtg2-stack-AWSEBAutoScalingScaleDownPolicy-HLU17ASRWM2N
2019-11-14 02:24:03    INFO    Created CloudWatch alarm named: awseb-e-sawuybrtg2-stack-AWSEBCloudwatchAlarmHigh-1JE1KAT37CRIB
2019-11-14 02:24:03    INFO    Created CloudWatch alarm named: awseb-e-sawuybrtg2-stack-AWSEBCloudwatchAlarmLow-1XFURG3PRQW54
2019-11-14 02:24:14    INFO    Application available at dev-env-zkspacwmyg.cn-northwest-1.eb.amazonaws.com.cn.
2019-11-14 02:24:15    INFO    Successfully launched environment: dev-env

eb open
```

- Make change and deploy

Make a change to index.html

``` Bash
eb deploy
eb open
```

- SSH to EB EC2 box

``` Bash
eb ssh
```

- Clean up everything

``` Bash
eb terminate --all

admin@~/ws/zaws-eb-p-blue$eb terminate --all
The application "zaws-eb-p-blue" and all its resources will be deleted.
This application currently has the following:
Running environments: 1
Configuration templates: 0
Application versions: 2

To confirm, type the application name: zaws-eb-p-blue
Removing application versions from s3.
2019-11-14 05:53:39    INFO    deleteApplication is starting.
2019-11-14 05:53:40    INFO    Invoking Environment Termination workflows.
2019-11-14 05:53:40    INFO    The environment termination step is done.
2019-11-14 05:53:41    INFO    The application has been deleted successfully.

```

