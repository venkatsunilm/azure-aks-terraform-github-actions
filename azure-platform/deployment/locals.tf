locals {
  resource_group_name = "rg-${var.environment}"
  location            = var.location
  environment         = var.environment

  # AKS
  cluster_name = "aks-${var.environment}"
  dns_prefix   = "${var.environment}-aks"

  # Networking
  vnet_name   = "vnet-${var.environment}"
  subnet_name = "subnet-${var.environment}"

  # storage
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 693547f (Feat(Docker): Implement Multi-Stage Docker Build with Cache Optimization and Dependency Management)
  # storage_account_name = "sa${var.environment}${random_string.storage_suffix.result}"

  # ACR
  registry_name           = "venkatsunilm${var.environment}"
=======
  storage_account_name = "sa${var.environment}${random_string.storage_suffix.result}"

  # ACR
<<<<<<< HEAD
  registry_name           = "venkatsunilm"
>>>>>>> 2c252cb (Refactor: refactoring the project as per the planned design (#28))
=======
  registry_name           = "venkatsunilm${var.environment}"
>>>>>>> 2e4e7e2 (Feat(cicd_new_design): Implement Full CI/CD Pipeline with Dynamic Environment Support and Reusable Actions (#44))
  acr_resource_group_name = "rg-acr-${var.environment}"

}
