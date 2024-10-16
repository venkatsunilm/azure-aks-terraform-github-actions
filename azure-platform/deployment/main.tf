resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = local.location
}

resource "azurerm_resource_group" "acr_rg" {
  name     = local.acr_resource_group_name
  location = local.location
}

module "acr" {
  source              = "../modules/acr"
  registry_name       = local.registry_name
  resource_group_name = azurerm_resource_group.acr_rg.name
  location            = azurerm_resource_group.acr_rg.location
  environment         = local.environment
  subscription_id     = var.subscription_id
}

module "aks" {
  source              = "../modules/aks"
  cluster_name        = local.cluster_name
  node_count          = var.node_count
  environment         = local.environment
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  dns_prefix          = local.dns_prefix
  subscription_id     = var.subscription_id
  acr_registry_id     = module.acr.acr_registry_id
  # dns_prefix_private_cluster
}

module "networking" {
  source              = "../modules/networking"
  vnet_name           = local.vnet_name
  subnet_name         = local.subnet_name
  resource_group_name = azurerm_resource_group.rg.name
  environment         = local.environment
  location            = azurerm_resource_group.rg.location
  subscription_id     = var.subscription_id
}

# Generate a random suffix for the storage account name
# resource "random_string" "storage_suffix" {
#   length  = 6
#   special = false
#   upper   = false
# }

# module "storage" {
#   source               = "../modules/storage"
#   storage_account_name = local.storage_account_name
#   resource_group_name  = azurerm_resource_group.rg.name
#   environment          = local.environment
#   location             = azurerm_resource_group.rg.location
#   subscription_id      = var.subscription_id
# }
