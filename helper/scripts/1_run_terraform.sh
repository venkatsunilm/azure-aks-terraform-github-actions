# Directory to run Terraform commands
TF_INFRA_DIR="/mnt/c/Users/harit/Documents/Visual Studio 2022/DevOps/DevOps-Terraform-Sample/azure-platform/deployment"
TF_APP_DIR="/mnt/c/Users/harit/Documents/Visual Studio 2022/DevOps/DevOps-Terraform-Sample/data-upload-app/deployment"

# Set the environment variable to dev
# export TF_VAR_environment="dev"

TF_DIR="${TF_DIR:-$TF_INFRA_DIR}"

# Change to the directory where Terraform files are located
cd "$TF_DIR" || { echo "Directory $TF_DIR not found"; exit 1; }

# Initialize Terraform
echo "Initializing Terraform in directory: $TF_DIR"
if ! terraform init  \
  -backend-config="key=$TF_VAR_environment/$DEPLOY_TYPE.tfstate"; then
  echo "Terraform initialization failed!"
  exit 1
fi

# Plan with the specified environment variable
# echo "Running Terraform plan for environment: $TF_VAR_environment"
# terraform plan -var-file="./$TF_VAR_environment.tfvars"

# Apply with the specified environment variable and auto-approve, saving output to a file
echo "Applying Terraform configuration for environment: $TF_VAR_environment"
# if ! terraform apply -var-file="./$TF_VAR_environment.tfvars" -var="kubeconfig_path=/mnt/c/Users/harit/.kube/config" -auto-approve; then
if ! terraform apply -var-file="./$TF_VAR_environment.tfvars" -auto-approve; then
  echo "Terraform apply failed!"
  exit 1
fi

# Optional: Destroy with the specified environment variable and auto-approve
# echo "Destroying Terraform resources for environment: $TF_VAR_environment"
# terraform destroy -var-file="./$TF_VAR_environment.tfvars" -auto-approve
