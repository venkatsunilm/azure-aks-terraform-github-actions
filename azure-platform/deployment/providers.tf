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
<<<<<<< HEAD
      version = "=4.0.1"
=======
      version = "=4.0.1" # install the latest terraform core if we use version > 4.0
>>>>>>> 2c252cb (Refactor: refactoring the project as per the planned design (#28))
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-backend"
    storage_account_name = "tfstate1727630878"
<<<<<<< HEAD
<<<<<<< HEAD
    container_name       = "infrastructure-state"
    key                  = "dev.infrastructure.tfstate"
=======
    container_name       = "tfstate"
    key                  = "terraform.tfstate" # State file name
>>>>>>> 2c252cb (Refactor: refactoring the project as per the planned design (#28))
=======
    container_name       = "infrastructure-state"
    key                  = "infrastructure.tfstate" # State file name
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
  }
}



