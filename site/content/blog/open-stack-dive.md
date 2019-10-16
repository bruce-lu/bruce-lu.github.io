---
title: "Dive into Openstack"
date: 2019-07-22T9:14:34+08:00
draft: false
images: []
---

## Objective

Dive into Openstack

## Keywords

- KVM, Openstack, Virtualization, Nova, Glance

## Environment

- Ubuntu 16.04 on Virtualbox for macOS

## KVM

- Kernel-based Virtual Machine
- kvm.ko for CPU & RAM mgmt
- Linux kernel & Qemu for I/O virtualization e.g. Storage & Networking
- Libvirt for managing Hypervisor like KVM, VirtualBox, Xen; Openstack uses Libvirt at its bottom
- Libvirt componments: libvirtd as daemon, API, virsh as CLI
- Virt-manager: GUI tool

## KVM management

- egrep -o '(vmx|svm)' /proc/cpuinfo
- service libvirt-bin status
- virt-manager
- virsh list // list virtual machines
- sudo apt-get install qemu-kvm qemu-system libvirt-bin virt-manager bridge-utils vlan
- sudo apt-get install xinit gdm kubuntu-desktop

## vCPU

- Every virtual CPU is a thread of process qemu-kvm
- vCPU can be overcommit, but need to be tested for performance

## Virtual memory

- Virtual Addres -> Physical Address on VM -> Machine Address on bare metal
- vMem can be overcommit, but need to be tested for performance

## Stoage virtualization

- Virtualization through Storage pool & volume
- Default storage pool: /var/lib/libvirt/images/
- A file is basically a volume


## Network virtualization

VM0 (vnet0), VM1 (vnet1) --- br0 (Linux bridge) --- eth0 (Physical)

- Create bridge br0 and mount physical eth0 on br0
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet manual

auto br0
iface br0 inet dhcp
  bridge_stp off
  bridge_waitport 0
  bridge_fd 0
  bridge_ports eth0

- brctl show
- ps -ef|grep dnsmasq // DHCP service, allocated IP could be found in config file: /var/lib/libvirt/dnsmasq/default.leases
- virsh list -all
- virsh domiflist VM1
- Linux bridge
  Working on TCP/IP 2nd layer, as a hub or switch, to be connected by devices in the network
- virbr0
  A default bridge created by KVM, to provide NAT services for vnet devices connected to the bridge





- VLAN Virtual Local Area Network
  - Work on layer 2, meaning arp can not cross the border of LAN, IP on 3rd layer could be communicated using a router
  - Switch with VLAN feature is required to implement VLAN. It can provide multiple LANs through its ports
  - Two modes of port configuration: Access and Trunk


## Tools

- vmdiff // to compare files

- 