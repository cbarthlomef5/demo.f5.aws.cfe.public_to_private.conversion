#!/bin/bash

echo "Running Terraform commands"
terraform init
terraform init -upgrade
terraform apply -auto-approve