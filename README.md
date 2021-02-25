# Introduction

This repo contains Terraform code with multiple modules to deploy resources into an Azure subscription.

# Steps to Run

In order to deploy:
0. Ensure that Azure CLI and Terraform are installed on your system.
1. Rename the file "terraform.tfvars.txt" at the root level to "terraform.tfvars" to remove the trailing .txt extension.
2. Update the .tfvars file with your own sample values
3. Run `terraform init` at the command line for initialization.
4. Run `terraform plan` at the command line to verify the plan.
5. Run `terraform apply` at the command line to deploy.

For your convenience, some placeholders for sample values have been provided in the .tfvars.txt file:

```
SUBSCRIPTION_ID = "<SUBSCRIPTION_ID>"
VM01_ADMIN_USR = "<SomeAdminUser>"
VM01_ADMIN_PWD = "<SomePassword>"

RESOURCE_GROUP_NAME = "<SomeResourceGroup>"
RESOURCE_GROUP_LOCATION = "<SomeLocation>"
```
 
# Results

If the deployment is successful, you should see the following items in your resource group:

1. Virtual network
2. Network Interface 
3. Virtual Machine
4. OS Disk