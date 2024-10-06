# Create Azure Container Registry (ACR)
resource "azurerm_container_registry" "acr" {
  name                = var.registry_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = local.sku
  # admin_enabled       = true # Optional: Enable admin access for pushing images
<<<<<<< HEAD

  tags = {
    environment = var.environment
  }

=======
>>>>>>> 2c252cb (Refactor: refactoring the project as per the planned design (#28))
}

