#!/bin/bash

# Update system
yum update -y
yum upgrade -y
yum autoremove -y

# Set file path variables
SSHFILEPATH="/home/ec2-user/.ssh" # SSH folder
AWSFILEPATH="/home/ec2-user/.aws" # AWS folder

# Check if .ssh folder exists
if [ -d $SSHFILEPATH ] 
then # if yes remove and re-create
    rm -rf $SSHFILEPATH
    mkdir $SSHFILEPATH
else # if no create
    mkdir $SSHFILEPATH
fi

# Check if .aws folder exists
if [ -d $AWSFILEPATH ] 
then # if yes remove and re-create
    rm -rf $AWSFILEPATH
    mkdir $AWSFILEPATH
else # if no create
    mkdir $AWSFILEPATH
fi

# Copy necessary files to system
echo "${certificate}" >> $SSHFILEPATH/id_rsa
echo "${knownhosts}" >> $SSHFILEPATH/known_hosts
echo "${shared_config_files}" >> $AWSFILEPATH/config
echo "${shared_credentials_files}" >> $AWSFILEPATH/credentials

# Install Git
yum install -y git

# Install Terraform
yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
yum install -y terraform

# Clone repo
FILEPATH="/home/ec2-user/code"
if [ -d $FILEPATH ] 
then # if yes remove and re-create
    rm -rf $FILEPATH
    mkdir $FILEPATH
    git clone git@github.com:cbarthlomef5/demo.f5.application.git code
else # if no create
    mkdir $FILEPATH
    git clone git@github.com:cbarthlomef5/demo.f5.application.git code
fi
# Change directory
cd $FILEPATH
# Run Terraform
# terraform init
# terraform init -upgrade
# terraform apply -auto-approve