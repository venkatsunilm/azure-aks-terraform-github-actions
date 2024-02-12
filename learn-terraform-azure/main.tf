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
  location = var.location

    tags = {
      Environment = "Terraform Getting Started"
      Team = "DevOps"
  }

}

module "virtual-nework" {
  source = "./modules/virtual-network"

  virtual_network_name = var.virtual_network_name
  resource_group_name = var.resource_group_name
  location = var.location
  virtual_network_address_space = var.virtual_network_address_space
  subnet_name = var.subnet_name
  subnet_address_prefix = var.subnet_address_prefix

}


