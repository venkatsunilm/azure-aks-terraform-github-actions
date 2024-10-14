output "module_path" {
  value = path.module
}

output "env_helm_values" {
  value = helm_release.data-upload-app.values
}
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 6d3e536 (Feat(helm_aks): Switch to Standard_B2s VM for Development and Integrate Helm with AKS )

output "aks_cluster_kube_config" {
  value = data.azurerm_kubernetes_cluster.aks.kube_config
}

output "aks_cluster_kube_admin_config" {
  value = data.azurerm_kubernetes_cluster.aks.kube_admin_config
}
<<<<<<< HEAD
=======
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
=======
>>>>>>> 6d3e536 (Feat(helm_aks): Switch to Standard_B2s VM for Development and Integrate Helm with AKS )
