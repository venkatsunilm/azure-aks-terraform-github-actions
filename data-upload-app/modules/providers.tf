# https://registry.terraform.io/providers/hashicorp/helm/latest/docs

provider "helm" {
  kubernetes {
<<<<<<< HEAD
<<<<<<< HEAD
    host                   = data.azurerm_kubernetes_cluster.aks.kube_config.0.host
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate)
    client_key             = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate)
  }
  alias = "aks"
}


=======
    config_path = "/home/runner/.kube/config"
    # config_path = "/mnt/c/Users/harit/.kube/config"
=======
    config_path = var.kubeconfig_path
>>>>>>> 2e4e7e2 (Feat(cicd_new_design): Implement Full CI/CD Pipeline with Dynamic Environment Support and Reusable Actions (#44))
  }

  alias = "aks"
}

>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.15.0"
    }
  }
}


