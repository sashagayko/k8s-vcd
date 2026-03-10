terraform {
  required_version = ">= 1.5.0"
  required_providers {
    vcd = {
      source  = "registry.terraform.io/vmware/vcd"
      version = "~> 3.14"
    }
  }
}
