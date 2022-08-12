# demo.f5.cfe.public_to_private.conversion

Steps to perform demo converting Cloud Failover Extention (CFE) deployed via CloudFormation Template (CFT) from Public facing to Private facing

# Resources
* CFE: https://clouddocs.f5.com/products/extensions/f5-cloud-failover/latest/userguide/overview.html
* CFT: https://github.com/F5Networks/f5-aws-cloudformation-v2/tree/main/examples/failover 
* UDF Template: https://udf.f5.com/b/6c47bd30-b7c0-47ce-a8c9-db8d3dfa0f73#documentation


# Demo Requirements
1. Must have the following applications installed to utilize automation
    * Terraform
        * Install terraform: https://learn.hashicorp.com/tutorials/terraform/install-cli
2. AWS Enviornment for Demo
3. AWS API access keys and permissions to deploy objects into environment


# Demo Setup
1. Start UDF instance from UDF template
2. Connect to UDF AWS Environment and subscribe to F5 product used in demo
    1. Use credentials provided from UDF deployment
        * Credentials found on the "Cloud Accounts" tab of UDF deployment
    2. Within AWS, navigate to AWS Marketplace
    3. Locate "Discover Products" within Marketplace page
    4. Search for and subscribe to "F5 BIG-IP BEST with IPI and Threat Campaigns (PAYG, 25Mbps)"
3. Copy files from "aws" folder to "~/.aws" folder and update credentials file with correct API Key and Secret
    * Folder should be located in current user's home directory
    * API Key and Secret can be found on the "Cloud Accounts" tab of the UDF deployment
    * Append API Key and Secret immediately after equals "=" sign
        * aws_access_key_id=APIKeyGoesHere
        * aws_secret_access_key=APISecretGoesHere
4. Generate new private key for SSH connections into AWS resources
    * <b>Strongly recomended to use a key not used for other purposes! Key will be copied to Bastion host for Demo purposes! Use ssh-keygen or Putty to create new keypair</b>
    * Save SSH key in Home directory as "~/.ssh/demo_id_rsa.pub"
5. Open preferred terminal and navigate to main directory of code
6. Run "main.sh" from root directory
7. Wait for deployment to complete
    * Full deployment is ~15-20 minutes
8. Once deployment is complete, log into Windows Bastion host and validate connectivity to BigIPs
    * All IP addresses can be found from AWS console

# Demo Steps
1. Show application availability via public IP
2. Show failover between appliances