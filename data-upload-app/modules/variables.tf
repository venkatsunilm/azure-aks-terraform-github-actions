variable "environment" {
  description = "The environment (dev or prod)"
  type        = string
}

variable "kubeconfig_path" {
  description = "Path to the Kubernetes config file"
  type        = string
  default     = "/home/runner/.kube/config" # Default value
}
