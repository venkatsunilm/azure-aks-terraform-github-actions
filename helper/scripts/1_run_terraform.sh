<<<<<<< HEAD
=======
<<<<<<<< HEAD:helper/1_run_terraform.sh
# Exit immediately if a command exits with a non-zero status
set -e

# Directory to run Terraform commands
TF_DIR="/mnt/c/Users/harit/Documents/Visual Studio 2022/DevOps/DevOps-Terraform-Sample/azure-platform/deployment"

# Set the environment variable to dev
export TF_VAR_environment="dev"

# Log file to capture the output
LOG_FILE="terraform_apply_output.log"

# Change to the directory where Terraform files are located
cd "$TF_DIR" || { echo "Directory $TF_DIR not found"; exit 1; }

# Initialize Terraform
echo "Initializing Terraform in directory: $TF_DIR..."
terraform init

# Plan with the specified environment variable
# echo "Running Terraform plan for environment: $TF_VAR_environment..."
# terraform plan -var-file="./$TF_VAR_environment.tfvars"

# Apply with the specified environment variable and auto-approve, saving output to a file
echo "Applying Terraform configuration for environment: $TF_VAR_environment..."
terraform apply -var-file="./$TF_VAR_environment.tfvars" -auto-approve | tee "$LOG_FILE"

# Optional: Destroy with the specified environment variable and auto-approve
# echo "Destroying Terraform resources for environment: $TF_VAR_environment..."
# terraform destroy -var-file="./$TF_VAR_environment.tfvars" -auto-approve | tee -a "$LOG_FILE"
========
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
# Directory to run Terraform commands
# TF_DIR="/mnt/c/Users/harit/Documents/Visual Studio 2022/DevOps/DevOps-Terraform-Sample/azure-platform/deployment"
# TF_DIR="/mnt/c/Users/harit/Documents/Visual Studio 2022/DevOps/DevOps-Terraform-Sample/data-upload-app/deployment"

# Set the environment variable to dev
# export TF_VAR_environment="dev"

# Change to the directory where Terraform files are located
cd "$TF_DIR" || { echo "Directory $TF_DIR not found"; exit 1; }

# Initialize Terraform
echo "Initializing Terraform in directory: $TF_DIR"
<<<<<<< HEAD
if ! terraform init  \
  -backend-config="key=$TF_VAR_environment/$DEPLOY_TYPE.tfstate"; then
=======
if ! terraform init; then
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
  echo "Terraform initialization failed!"
  exit 1
fi

# Plan with the specified environment variable
# echo "Running Terraform plan for environment: $TF_VAR_environment"
# terraform plan -var-file="./$TF_VAR_environment.tfvars"

# Apply with the specified environment variable and auto-approve, saving output to a file
echo "Applying Terraform configuration for environment: $TF_VAR_environment"
<<<<<<< HEAD
# if ! terraform apply -var-file="./$TF_VAR_environment.tfvars" -var="kubeconfig_path=/mnt/c/Users/harit/.kube/config" -auto-approve; then
=======
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
if ! terraform apply -var-file="./$TF_VAR_environment.tfvars" -auto-approve; then
  echo "Terraform apply failed!"
  exit 1
fi

# Optional: Destroy with the specified environment variable and auto-approve
# echo "Destroying Terraform resources for environment: $TF_VAR_environment"
# terraform destroy -var-file="./$TF_VAR_environment.tfvars" -auto-approve
<<<<<<< HEAD
=======
>>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33)):helper/scripts/1_run_terraform.sh
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
