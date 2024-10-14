<<<<<<< HEAD
<<<<<<< HEAD
module "app" {
  source             = "../modules"
  environment        = local.environment
  aks_cluster_name   = local.aks_cluster_name
  aks_resource_group = local.resource_group_name
}
=======
# https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release

resource "helm_release" "data-upload-app" {
  name  = local.app_name
  chart = "${path.module}/app-chart" # Adjust path to app-chart

  values = [
    file("${path.module}/app-chart/${var.environment}-values.yaml") # Adjust for environment-specific values
  ]

}
<<<<<<< HEAD
>>>>>>> 2c252cb (Refactor: refactoring the project as per the planned design (#28))
=======

>>>>>>> 6debb0f (Refactor: code cleanup and renaming (#32))
=======
module "app" {
  source             = "../modules"
  environment        = local.environment
  aks_cluster_name   = local.aks_cluster_name
  aks_resource_group = local.resource_group_name
}
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
