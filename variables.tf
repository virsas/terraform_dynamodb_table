variable "table" { 
  default = { 
    name = "example"
    billing = "PAY_PER_REQUEST"
    hashkey = "ID"
    sortkey = ""
    encryption = false
    recovery = false
    replica  = "eu-central-1"
    readcap  = 0
    writecap = 0
    attributes = [
      { name = "ID", type = "S" }
    ]
  }
}
