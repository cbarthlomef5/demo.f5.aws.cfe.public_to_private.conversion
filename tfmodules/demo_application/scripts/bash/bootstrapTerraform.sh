#!/bin/bash
sleep 15
# Update system
yum update -y
yum upgrade -y
yum autoremove -y

# Set file path variables
AWSFILEPATH="/home/ec2-user/.aws" # AWS folder
mkdir $AWSFILEPATH

# Copy necessary files to system
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
    git clone https://github.com/cbarthlomef5/demo.f5.application.git $FILEPATH
else # if no create
    mkdir $FILEPATH
    git clone https://github.com/cbarthlomef5/demo.f5.application.git $FILEPATH
fi
# Change directory
cd $FILEPATH
# Run Terraform
terraform init -upgrade
terraform apply -auto-approve