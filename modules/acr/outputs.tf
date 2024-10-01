
output "acr_registry_name" {
  description = "The name of the AKS cluster"
  value       = azurerm_container_registry.acr.name
}
