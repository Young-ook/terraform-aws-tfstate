# Terraform Backend: S3
This backend type stores the state as a given key in a given bucket on Amazon S3. This backend also supports state locking and consistency checking via Dynamo DB, which can be enabled by setting the dynamodb_table field to an existing DynamoDB table name. A single DynamoDB table can be used to lock multiple remote state files. Terraform generates key names that include the values of the bucket and key variables.

## Download example
Download this example on your workspace
```sh
git clone https://github.com/Young-ook/terraform-aws-tfstate-backend
cd terraform-aws-tfstate-backend/examples/backend
```

## Setup
[This](https://github.com/Young-ook/terraform-aws-tfstate-backend/blob/main/examples/backend/main.tf) is an example of terraform configuration file to create an S3 bucket and DynamoDB for terraform backend. Run terraform command.

If you don't have the terraform tools in your environment, go to the main [page](https://github.com/Young-ook/terraform-aws-tfstate-backend) of this repository and follow the installation instructions.

Run terraform:
```
terraform init
terraform apply
```
Also you can use the `-var-file` option for customized paramters when you run the terraform plan/apply command.
```
terraform plan -var-file tc1.tfvars
terraform apply -var-file tc1.tfvars
```

## Clean up
Run terraform:
```
terraform destroy
```
Don't forget you have to use the `-var-file` option when you run terraform destroy command to delete the aws resources created with extra variable files.
```
terraform destroy -var-file tc1.tfvars
```
