provider "azurerm" {
  subscription_id = var.subscription_id
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.0.1" # install the latest terraform core if we use version > 4.0
    }
  }

  #   backend "azurerm" {
  #     storage_account_name = "terraform-backend"
  #     container_name       = "state"
  #     key                  = "${var.environment}.tfstate"
  #   }

}


