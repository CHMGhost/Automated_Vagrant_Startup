# Ansible Playbook and Vagrant Box Setup

This repository contains a script to set up a Vagrant box and an Ansible playbook to prepare it for use.

## Prerequisites

- Ansible
- Vagrant
- VirtualBox

## Script - `vm_creation.sh`

This bash script automates the creation of a directory for a Vagrant box and the Vagrantfile itself. The script asks for user input to specify the name of the directory and the type of OS for the Vagrant box.

*The RHEL portion is still a WIP. It will create the Vagrant box but will not update the box*

### Usage

To run the script, make it executable and then execute it:

```
bash
chmod +x vm_creation.sh
./vm_creation.sh
```

It will prompt you for the directory name and the OS type, and then it will create a Vagrant box accordingly.

## Ansible Playbook 

This Ansible playbook is designed to be run on the Vagrant box created with `vm_creation.sh`. It performs the following tasks:

- Checks if the OS is Ubuntu or RHEL
- Installs the necessary packages
- Checks if Python is installed, and installs it if necessary
- Checks if MariaDB is installed, and installs it if necessary
- Start up the Vagrant Box
- SSH into the Vagrant BoxAu

### Usage

To run the playbook, execute the following command:

```
ansible-playbook playbooks/tasks/main.yml
```

This command will run the playbook on your local machine. Note that the playbook requires superuser privileges to install packages, so you may need to include `-K` in the command to be prompted for your sudo password:

```
ansible-playbook playbooks/tasks/main.yml
```

## Vagrant

After the Vagrant box is created and configured by the script, you can start it with:

```
vagrant up
```

And you can connect to it via SSH with:

```
vagrant ssh
```