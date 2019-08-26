---
title: "Automation with Ansible"
date: 2019-07-05T21:36:34+08:00
draft: false
images: []
---

## Playbook

Plays -> Tasks -> Modules -> Handlers

## Modules

more than 450 modules provided by Ansible
common modules: yum, ping

## How to

- yum install ansible
- Ad-Hoc: ansible $inventory -m ping
- Playbook: ansible-playbook mybook.yml
- Ansible Tower:
- Options, Dry-run, -C mode
- ansible-doc
- ansible-galaxy
- ansible-config
- ansible-inventory
- ansible-pull
- ansible-vault
- ansible-console

## Configuration

/etc/ansible/ansible.cfg
/etc/ansible/hosts
/etc/ansible/roles/

## Inventory

- Host
  192.168.0.2
  www.example.com
  www[01:50].example.com

- Host var
  www.example.com k1=v1 k2=v2

- Group
  [group name]
  www.example.com k1=v1 k2=v2
  192.168.0.2 k1=v1 k2=v2

- Group var
  [GroupName:vars]
  k1=v1
  k2=v2

## Get hands dirty

- ansible $host-or-group-name -m copy -a "content='hello' dest=/root/hello.txt"

## Reference

- [One hour Ansible CN version](https://www.jianshu.com/p/62388a4fcbc6)
