locals {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  resource_group_name = "rg-${var.environment}"
  aks_cluster_name    = "aks-${var.environment}"
  location            = var.location
  environment         = var.environment
=======
  app_name = "data-upload-webapp"
>>>>>>> 2c252cb (Refactor: refactoring the project as per the planned design (#28))
=======
  app_name = "data-upload-app"
>>>>>>> 6debb0f (Refactor: code cleanup and renaming (#32))
=======
  resource_group_name = "rg-${var.environment}"
  aks_cluster_name    = "aks-${var.environment}"
  location            = var.location
  environment         = var.environment
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
}
