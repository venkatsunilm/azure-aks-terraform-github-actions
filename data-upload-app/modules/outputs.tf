output "module_path" {
  value = path.module
}

output "env_helm_values" {
  value = helm_release.data-upload-app.values
}
