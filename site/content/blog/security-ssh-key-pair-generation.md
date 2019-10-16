---
title: "Security - Generating ssh key pair"
date: 2019-10-07T08:41:34+08:00
draft: false
images: []
---

## Objective

To access a remote server through ssh keys

## Using ssh-keygen tool

ssh-keygen -t rsa -N "" -b 2048 -C "blue-cloud-kp" -f ./blue-cloud.pub

## Reference

- [Manage key pair](https://docs.cloud.oracle.com/iaas/Content/Compute/Tasks/managingkeypairs.htm)

## Conclusion

The key pair could be used to access remote servers.
