<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 6d3e536 (Feat(helm_aks): Switch to Standard_B2s VM for Development and Integrate Helm with AKS )
# https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release

// Retrieve AKS cluster information
data "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  resource_group_name = var.aks_resource_group
}

resource "helm_release" "data-upload-app" {
  name  = local.app_name
  chart = "${path.module}/app-chart" # Adjust path to app-chart

  values = [
    file("${path.module}/app-chart/${var.environment}-values.yaml") # Adjust for environment-specific values
  ]

  provider = helm.aks
}
<<<<<<< HEAD
=======
# https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release

resource "helm_release" "data-upload-app" {
  name  = local.app_name
  chart = "${path.module}/app-chart" # Adjust path to app-chart

  values = [
    file("${path.module}/app-chart/${var.environment}-values.yaml") # Adjust for environment-specific values
  ]

}
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
=======
>>>>>>> 6d3e536 (Feat(helm_aks): Switch to Standard_B2s VM for Development and Integrate Helm with AKS )
