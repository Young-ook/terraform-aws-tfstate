# Example

## Usage
Please see [this](main.tf) file for detail code.

```
module "tfstate-backend" {
  source                  = "Young-ook/tfstate-backend/aws"
  name                    = "hello-terraform"
  dynamodb_read_capacity  = 10
  dynamodb_write_capacity = 10
}
```

And if you want change the parameters of this example with your own environment, you can edit terraform file (`main.tf`) directly or update the variables in `tfvars` file.

```
aws_region              = "ap-northeast-2"
name                    = "my-tfbackend"
dynamodb_read_capacity  = "10"
dynamodb_write_capacity = "20"
```
