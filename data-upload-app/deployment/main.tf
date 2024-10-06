<<<<<<< HEAD
module "app" {
  source             = "../modules"
  environment        = local.environment
  aks_cluster_name   = local.aks_cluster_name
  aks_resource_group = local.resource_group_name
}
=======
# https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release

resource "helm_release" "data-upload-webapp" {
  name  = local.app_name
  chart = "${path.module}/webapp-chart" # Adjust path to webapp-chart

  values = [
    file("${path.module}/webapp-chart/${var.environment}-values.yaml") # Adjust for environment-specific values
  ]

}
>>>>>>> 2c252cb (Refactor: refactoring the project as per the planned design (#28))
