resource "aws_dynamodb_table" "table" {
  name           = var.instance.name
  billing_mode   = var.instance.billing
  hash_key       = var.instance.hashkey
  range_key      = var.instance.sortkey

  dynamic "attribute" {
    for_each = [for s in var.instance.attributes: {
      name = s.name
      type = s.type
    }]

    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  server_side_encryption {
    enabled        = var.instance.encryption
  }

  point_in_time_recovery {
    enabled        = var.instance.recovery
  }

  ttl {
    attribute_name = "DynamoDBTableTTL"
    enabled        = var.instance.ttl
  }

  replica {
    region_name = var.instance.replica
  }
}