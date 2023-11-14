[[English](README.md)] [[한국어](README.ko.md)]

# Terraform Remote State
This is a example to show how to create a remote backend for terraform state file. This example uses Amazon S3 bucket as an state file storage. and DynamoDB for state locking for concurrency and consistency of terraform jobs. A single DynamoDB table can be used to lock multiple remote state files. Terraform generates key names that include the values of the bucket and key variables.

# Setup
### Prerequisites
This module requires terraform command line tool. If you don't have the terraform tool in your environment, go to the main [page](https://github.com/Young-ook/terraform-aws-tfstate) of this repository and follow the installation instructions.

## Download
Download this example on your workspace
```
git clone https://github.com/Young-ook/terraform-aws-tfstate
cd terraform-aws-tfstate/examples/backend
```

Then you are in **backend** directory under your current workspace. There is an exmaple that shows how to use terraform configurations to create and manage an S3 bucket and DynamoDB table for terraform state management on your AWS account. Please make sure that you have installed the terraform in your workspace before moving to the next step.

Run terraform:
```
terraform init
terraform apply
```

Also you can use the `-var-file` option for customized paramters when you run the terraform plan/apply command.
```
terraform plan -var-file fixture.tc1.tfvars
terraform apply -var-file fixture.tc1.tfvars
```

## Clean up
Run terraform:
```
terraform destroy
```

**[DON'T FORGET]** You have to use the *-var-file* option when you run terraform destroy command to delete the aws resources created with extra variable files.
```
terraform destroy -var-file fixture.tc1.tfvars
```
