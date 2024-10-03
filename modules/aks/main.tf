resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  #   kubernetes_version  = "1.26.3"

  default_node_pool {
    name       = local.node_pool_name
    node_count = var.node_count
    vm_size    = local.vm_size
    # os_disk_size_gb = 30
  }

  identity {
    type = local.type
  }

  tags = {
    environment = var.environment
  }

}

