#!/bin/bash

echo "Running Terraform commands"
terraform init -upgrade
terraform apply -auto-approve