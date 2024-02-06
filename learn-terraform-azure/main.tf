# Configure the Azure provider
terraform {
  
  required_version = ">= 1.1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  cloud {
    organization = "venkat_devops"
    workspaces {
      name = "learn-terraform-azure"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.azure_region

    tags = {
      Environment = "Terraform Getting Started"
      Team = "DevOps"
  }

}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = var.azure_vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = var.azure_region
  resource_group_name = azurerm_resource_group.rg.name
}

