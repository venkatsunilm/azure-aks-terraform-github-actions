# https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release

resource "helm_release" "data-upload-webapp" {
  name  = local.app_name
  chart = "${path.module}/webapp-chart" # Adjust path to webapp-chart

  values = [
    file("${path.module}/webapp-chart/${var.environment}-values.yaml") # Adjust for environment-specific values
  ]

}
