provider "aws" {
  region = var.region
}

resource "aws_dynamodb_table" "table" {
  name           = var.table.name
  billing_mode   = var.table.billing
  hash_key       = var.table.hashkey
  range_key      = var.table.sortkey

  dynamic "attribute" {
    for_each = [for s in var.table.attributes: {
      name = s.name
      type = s.type
    }]

    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  server_side_encryption {
    enabled        = var.table.encryption
  }

  point_in_time_recovery {
    enabled        = var.table.recovery
  }

  replica {
    region_name = var.table.replica
  }

  stream_enabled = true
}