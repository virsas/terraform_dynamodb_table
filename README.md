# terraform_dynamodb_table

Terraform module to create dynamoDB table

## Dependencies

none

## Terraform example

``` terraform
##################
# DynamoDB Variable
##################
variable "example" { 
  default = {
    name        = "example"
    # The valid values are PROVISIONED and PAY_PER_REQUEST
    billing     = "PAY_PER_REQUEST"
    hashkey     = "ID"
    sortkey     = "Score"
    encryption  = true
    recovery    = false
    # write a region where you want your dynamodb to be replicated to
    replica     = "eu-west-2"
    # The number of read and write units for this table
    # 0 disabled limitation
    readcap     = 0
    writecap    = 0
    # you can have any number of attributes
    attributes = [
      { name = "ID", type = "S" },
      { name = "Name", type = "S" },
      { name = "Date", type = "S" },
      { name = "Score", type = "N" }
    ]
  } 
}

##################
# DynamoDB Table
##################
module "dynamodb_tf_lock" {
  source = "github.com/virsas/terraform_dynamodb_table"
  table = var.example
}
```
