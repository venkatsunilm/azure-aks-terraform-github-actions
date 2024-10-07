# https://registry.terraform.io/providers/hashicorp/helm/latest/docs

provider "helm" {
  kubernetes {
    config_path = "/home/runner/.kube/config"
    # config_path = "/mnt/c/Users/harit/.kube/config"
  }

  alias = "aks"
}

terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.15.0"
    }
  }
}


