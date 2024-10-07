# https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release

resource "helm_release" "data-upload-app" {
  name  = local.app_name
  chart = "${path.module}/app-chart" # Adjust path to app-chart

  values = [
    file("${path.module}/app-chart/${var.environment}-values.yaml") # Adjust for environment-specific values
  ]

}
