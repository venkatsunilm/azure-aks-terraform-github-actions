<<<<<<< HEAD
<<<<<<< HEAD
provider "azurerm" {
  subscription_id = var.subscription_id
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
=======
# https://registry.terraform.io/providers/hashicorp/helm/latest/docs

# TODO: Remove azurerm provider as the root is already setting the provider. 
=======
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
provider "azurerm" {
  subscription_id = var.subscription_id
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
<<<<<<< HEAD

  alias = "aks"
>>>>>>> 2c252cb (Refactor: refactoring the project as per the planned design (#28))
=======
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.0.1"
    }
<<<<<<< HEAD
<<<<<<< HEAD
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-backend"
    storage_account_name = "tfstate1727630878"
    container_name       = "application-state"
    key                  = "dev.application.tfstate"
=======

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.15.0"
    }
>>>>>>> 2c252cb (Refactor: refactoring the project as per the planned design (#28))
=======
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-backend"
    storage_account_name = "tfstate1727630878"
    container_name       = "application-state"
    key                  = "application.tfstate"
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
  }
}


<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> 2c252cb (Refactor: refactoring the project as per the planned design (#28))
=======

>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
