# https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release

resource "helm_release" "data-upload-webapp" {
  name  = local.app_name
  chart = "${path.module}/data-upload-webapp-chart"

  values = [
    file("${path.module}/data-upload-webapp-chart/${var.environment}-values.yaml")
  ]

}
