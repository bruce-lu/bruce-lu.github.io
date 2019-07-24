---
title: "Using self-signed SSL certificate for AWS Elastic Beanstalk"
date: 2019-07-24T10:14:34+08:00
draft: false
images: []
---

## Objective

There are cases we need run a quick PoC with HTTPS enabled in AWS Elastic Beanstalk. In such cases, one of an efficient way is to use a self-signed certificate. Please note you can use AWS Certificate Manager to generate certificate if it's enabled in your region. I'll demostrate how to generate and use a self-signed certificate in AWS CLI here in this blog.

## Keywords

- SSL, HTTPS, x509, Beanstalk, AWS

## Environment

- macOS in local
- AWS console in remote

## Generating a new self-signed certificate

- Generate a private key with length 2048

  ``` Bash
  openssl genrsa 2048 > privatekey.pem
  ```

- Generate a certificate signing request - csr

  ``` Bash
  openssl req -new -key privatekey.pem -out csr.pem


  Country Name (2 letter code) []:CT
  State or Province Name (full name) []:State
  Locality Name (eg, city) []:City
  Organization Name (eg, company) []:ON
  Organizational Unit Name (eg, section) []:OU
  Common Name (eg, fully qualified host name) []:mypoc.eb.amazonaws.com
  Email Address []: my@email.com
  ```

- Self sign the certificate

  ``` Bash
  openssl x509 -req -days 3650 -in csr.pem -signkey privatekey.pem -out server.crt
  ```

- Generate Access key for AWS CLI

  Go to AWS console Users to generate Access key

- Configure AWS CLI

  I'd use AWS CLI to upload the certificate, so I installed AWS CLI tool on my laptop.

  Here is a [Guide to install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-macos.html)

  After the installation, configure it:

  ``` Bash
  aws configure

  # Output like this:
  AWS Access Key ID [****************]: ******
  AWS Secret Access Key [****************]: ******
  Default region name [None]: ******
  Default output format [None]: json
  ```

## Upload the certificate into AWS

- Upload

  ``` Bash
  aws iam upload-server-certificate --server-certificate-name elastic-beanstalk-x509 --certificate-body file://server.crt --private-key file://privatekey.pem
  # Output like this:
  {
      "ServerCertificateMetadata": {
          "Path": "/",
          "ServerCertificateName": "****************",
          "ServerCertificateId": "****************",
          "Arn": "****************",
          "UploadDate": "2019-07-23T10:33:13Z",
          "Expiration": "2029-07-20T10:02:18Z"
      }
  }
  ```

## Use the new self-signed certificate in AWS Elastic Beanstalk (EB)

- Enable Load balancer of EB

  If EB does not exist, feel free to create one with web server environment tier.

  Go to Elastic Beanstalk Application -> Environment -> Configuration -> Capacity -> Modify -> Environment type -> Load balanced -> Apply

- Add listener

  Go to Elastic Beanstalk Application -> Environment -> Configuration -> Load balancer -> Modify -> Add listener -> Listener port: 443, Listener protocol: HTTPS, Instance port: 80, Instance protocol: HTTP -> Add -> Apply the configuration

## Verify

- Get the app URL and change the protocol to https on browser. Accept or add exception because it's a self-signed certificate for low level environment testing purpose. It should be secure now.








  




