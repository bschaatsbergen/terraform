
required_providers {
  testing = {
    source  = "hashicorp/testing"
    version = "0.1.0"
  }
}

provider "testing" "main" {}

provider "testing" "credentialed" {
  config {
    require_auth = true
    authentication = component.load.credentials
  }
}

component "load" {
  source = "../load"

  providers = {
    testing = provider.testing.main
  }
}

removed {
  source = "../create"
  from = component.create
  providers = {
    testing = provider.testing.credentialed
  }
}