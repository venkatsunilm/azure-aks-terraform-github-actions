terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.0.1"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.environment}"
  location = var.location
}

module "aks" {
  source              = "../../modules/aks"
  cluster_name        = "aks-${var.environment}"
  node_count          = var.node_count
  environment         = var.environment
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  dns_prefix          = "${var.environment}-aks"
  subscription_id     = var.subscription_id
}

module "networking" {
  source              = "../../modules/networking"
  vnet_name           = "vnet-${var.environment}"
  subnet_name         = "subnet-${var.environment}"
  resource_group_name = azurerm_resource_group.rg.name
  environment         = var.environment
  location            = azurerm_resource_group.rg.location
  subscription_id     = var.subscription_id
}

module "storage" {
  source               = "../../modules/storage"
  storage_account_name = "sa${var.environment}"
  resource_group_name  = azurerm_resource_group.rg.name
  environment          = var.environment
  location             = azurerm_resource_group.rg.location
  subscription_id      = var.subscription_id
}
