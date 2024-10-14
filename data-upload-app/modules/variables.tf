variable "environment" {
  description = "The environment (dev or prod)"
  type        = string
}

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 2e4e7e2 (Feat(cicd_new_design): Implement Full CI/CD Pipeline with Dynamic Environment Support and Reusable Actions (#44))
variable "kubeconfig_path" {
  description = "Path to the Kubernetes config file"
  type        = string
  default     = "/home/runner/.kube/config" # Default value
}
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 6d3e536 (Feat(helm_aks): Switch to Standard_B2s VM for Development and Integrate Helm with AKS )

variable "aks_cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "aks_resource_group" {
  description = "The name of the AKS resource group"
  type        = string
}
<<<<<<< HEAD
=======
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
=======
>>>>>>> 2e4e7e2 (Feat(cicd_new_design): Implement Full CI/CD Pipeline with Dynamic Environment Support and Reusable Actions (#44))
=======
>>>>>>> 6d3e536 (Feat(helm_aks): Switch to Standard_B2s VM for Development and Integrate Helm with AKS )
