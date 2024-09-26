terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  #   kubernetes_version  = "1.26.3"

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = "Standard_D2_v2"
    # os_disk_size_gb = 30
  }

  identity {
    type = "SystemAssigned"
  }

  #   service_principal {
  #     client_id     = var.appId
  #     client_secret = var.password
  #   }

  #   role_based_access_control_enabled = true

  tags = {
    environment = var.environment
  }

}

