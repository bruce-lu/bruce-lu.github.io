---
title: "Ubuntu1804 by Canonical"
date: 2019-08-27T08:28:09+08:00
draft: false
images: []
---

## Package mgmt

- dpkg

  ``` Bash
  # dkpg does not install dependencies automatically

  # See if apache2 is installed
  dpkg -l | grep apache2

  # List all files installed for ufw
  dpkg -L ufw 

  # Which package installed a file
  dpkg -S /etc/host.conf 

  # Install a local .deb file
  sudo dpkg -i zip_3.0-4_i386.deb

  # Uninstalling a package
  sudo dpkg -r zip
  ```

- apt - Ubuntu's Advanced Packaging Tool (APT) 

  ``` Bash
  #
  apt [install | remove  | update | upgrade] [$pkg1 $pkg2 ..]

  # Update the Package Index: The APT package index is essentially a database of available packages from the repositories defined in the /etc/apt/sources.list file and in the /etc/apt/sources.list.d directory. To update the index:
  apt update

  # discover to which package a file belongs
  apt-file search docker

  # Or using dpkg to find package names
  dpkg -S stdio.h

  # More
  apt help

  # Most used commands:
  list - list packages based on package names, [installed | upgradable ..]
  search - search in package descriptions = apt-cache search
  show - show package details = apt-cache show
  install - install packages
  remove - remove packages
  autoremove - Remove automatically all unused packages
  update - update list of available packages
  upgrade - upgrade the system by installing/upgrading packages
  full-upgrade - upgrade the system by removing/installing/upgrading packages
  edit-sources - edit the source information file

  # Diff between apt and apt-get: https://askubuntu.com/questions/445384/what-is-the-difference-between-apt-and-apt-get
  # apt is higher level of apt-get which is low level, backend of apt, and backwards compatible. apt is better for end-users and doesn't require or contain some extra features in that are present in apt-get.

  ```

## Kernel Crash Dump

- sudo apt install linux-crashdump
- /etc/default/kdump-tools // USE_KDUMP=1
- Remote dump: SSH="ubuntu@kdump-netcrash" or NFS="kdump-netcrash:/var/crash" in /etc/default/kdump-tools
- Verification

  ``` Bash
  cat /proc/cmdline // crashkernel boot parameter should be represented in /proc/cmdline
  ```

- Verify that the kernel has reserved the requested memory area for the kdump kernel 

  ``` Bash
  dmesg | grep -i crash
  kdump-config show
  ```

- Testing the Crash Dump Mechanism

  ``` Bash
  cat /proc/sys/kernel/sysrq // SysRQ should be 1, if not, sudo sysctl -w kernel.sysrq=1
  echo c > /proc/sysrq-trigger // to trigger the dump
  ls /var/crash
  ```

## Tools

- [Cloud-init](https://cloudinit.readthedocs.io/en/latest/)
- [Juju](https://jaas.ai/docs)
- [MaaS](https://maas.io/docs)

## Getting help

- [Ubuntu server guide](https://help.ubuntu.com/lts/serverguide/index.html)
- [Ubuntu desktop guide](https://help.ubuntu.com/lts/ubuntu-help/index.html)
- [Linux Kernel in a Nutshell](http://www.kroah.com/lkn/)
