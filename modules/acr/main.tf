# Create Azure Container Registry (ACR)
resource "azurerm_container_registry" "acr" {
  name                = var.registry_name
  resource_group_name = azurerm_resource_group.acr_rg.name
  location            = azurerm_resource_group.acr_rg.location
  sku                 = local.sku
  # admin_enabled       = true # Optional: Enable admin access for pushing images
}

