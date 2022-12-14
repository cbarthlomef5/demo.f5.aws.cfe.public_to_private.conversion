# demo.f5.cfe.public_to_private.conversion

Steps to perform demo converting Cloud Failover Extention (CFE) deployed via CloudFormation Template (CFT) from Public facing to Private facing

# Use Case
* Remove public access into BigIP HA pair deployed via Cloud Formation Template
* Concept is based on document from Michael O'Leary
    * https://community.f5.com/t5/technical-articles/deploy-big-ip-in-aws-with-ha-across-az-s-without-using-eip-s/ta-p/291221

# Resources
* CFE Overview: https://clouddocs.f5.com/products/extensions/f5-cloud-failover/latest/
* CFE Quickstart Guide: https://clouddocs.f5.com/products/extensions/f5-cloud-failover/latest/userguide/quickstart.html#quickstart
* CFT: https://github.com/F5Networks/f5-aws-cloudformation-v2/tree/main/examples/failover 
* UDF Template: https://udf.f5.com/b/6c47bd30-b7c0-47ce-a8c9-db8d3dfa0f73#documentation


# Demo Requirements
1. Must have the following applications installed to utilize automation
    * Terraform
        * Install terraform: https://learn.hashicorp.com/tutorials/terraform/install-cli
2. AWS Enviornment for Demo
    * <b> DEMO BUILDS NEW ENVIRONMENT! ADVISED TO USE CLEAN AWS ENVIRONMENT TO AVOID RESOURCE CONFLICTS! </b>
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
    * IP can be obtained from CFT outputs or from Elastic IP Addressess console in AWS
        * Elastic IP name: f5demo-bigip-external-eip-03
2. Show failover between appliances
3. Use Postman on Windows Bastion host to view current CFE information
    * Disable SSL verification within Postman Settings
    * Postman URLs can be found in postmanCommands.txt
    * Use Basic Authentication
        * User: admin
        * PW: Obtain from globalVariables.tf file
4. Create VIP within Alien range
5. Check for HA tag on necessary resources
    * Failover Tag Information
        * Tag Key: f5_cloud_failover_label
        * Tag Value: bigip_high_availability_solution
    * Resources to tag
        * Network Interfaces
            * f5demo-bigip-static-external-int-01
            * f5demo-bigip-static-external-int-02
        * Route Tables
            * security_vpc-default-rt
6. Change source/dest.check to Disabled on Network Interfaces
    * Network Interfaces
            * f5demo-bigip-static-external-int-01
            * f5demo-bigip-static-external-int-02
7. Update route table to add alien IP range
    * Route Table Name: security_vpc-default-rt
    * IP Subnet to add: 192.168.50.0/24
    * Destination: interface ID for f5demo-bigip-static-external-int-"activedevice"
8. Deploy new CFE declaration to BigIP
    * Use cfe_declaration_example.txt file
    * <b>REPLACE scopingName WITH CORRECT ROUTE TABLE ID!</b>
    * defaultNextHopAddresses items should be IP address of interfaces used in failover
    * Deploy via Postman to BigIP
9. Failover between appliances
    * Route table entry should update to new ENI after a few seconds
10. Re-test applications
11. Remove all public EIPs from BigIP applainces
12. Associate BigIP subnets with internal Private route table
    * Route Table Name: security_vpc-internal_subnet-rt