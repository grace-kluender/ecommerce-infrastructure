terraform {

  required_version = ">= 1.0"

  backend "local" {
    path = "terraform-state/terraform.tfstate"
  }

}