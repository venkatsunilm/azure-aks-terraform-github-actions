resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = local.location
}

<<<<<<< HEAD
<<<<<<< HEAD
=======
# Create Resource Group for ACR
>>>>>>> 2c252cb (Refactor: refactoring the project as per the planned design (#28))
=======
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
resource "azurerm_resource_group" "acr_rg" {
  name     = local.acr_resource_group_name
  location = local.location
}

module "acr" {
  source              = "../modules/acr"
  registry_name       = local.registry_name
  resource_group_name = azurerm_resource_group.acr_rg.name
  location            = azurerm_resource_group.acr_rg.location
<<<<<<< HEAD
<<<<<<< HEAD
  environment         = local.environment
=======
>>>>>>> 2c252cb (Refactor: refactoring the project as per the planned design (#28))
=======
  environment         = local.environment
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
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
<<<<<<< HEAD
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
=======
resource "random_string" "storage_suffix" {
  length  = 6
  special = false
  upper   = false
}

module "storage" {
  source               = "../modules/storage"
  storage_account_name = local.storage_account_name
  resource_group_name  = azurerm_resource_group.rg.name
  environment          = local.environment
  location             = azurerm_resource_group.rg.location
  subscription_id      = var.subscription_id
}
<<<<<<< HEAD

module "app" {
  source          = "../../data-upload-app/deployment"
  environment     = local.environment
  subscription_id = var.subscription_id
}
>>>>>>> 2c252cb (Refactor: refactoring the project as per the planned design (#28))
=======
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
