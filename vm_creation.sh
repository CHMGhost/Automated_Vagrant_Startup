#!/bin/bash

echo "What would like to call this VM?"
read dir

echo "What OS will you like to use? (ubuntu or redhat)"
read os

file="Vagrantfile"

# Converts dir to lowercase
dir=${dir,,}

# Converts User's OS choice to lowercase
os=${os,,}

# OS choice logic
if [[ "$os" == "ubuntu" ]]; then
	box="generic/ubuntu2210"
elif [[ "$os" == "redhat" ]]; then
	box="generic/rhel7"
else
	echo "Invaild OS type. Only enter ubuntu or redhat"
	exit 1
fi

# Creates the directory that will house the Vagrantfile
mkdir -p $dir

cd $dir

# Checks to see if the Vagrantfile exists
if [ -f $file ]; then
	echo "This file already exists"
else
    	# Generates the Vagrantfile
	cat << EOF > $file
Vagrant.configure("2") do |config|
  config.vm.box = "$box"
  config.vm.provision "ansible" do |ansible|
	ansible.playbook = "playbooks/vm_creation/tasks/main.yml"
 	ansible.compatibility_mode = "2.0"
  end
end
EOF

	echo "File was created"
fi

echo "Starting the VM"
vagrant up

echo "Entering the VM, Enjoy!"
vagrant ssh



