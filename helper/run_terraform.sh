# Exit immediately if a command exits with a non-zero status
set -e

# Directory to run Terraform commands
TF_DIR="/mnt/c/Users/harit/Documents/Visual Studio 2022/DevOps/DevOps-Terraform-Sample/deployment/shared"

# Set the environment variable to development
export TF_VAR_environment="development"

# Log file to capture the output
LOG_FILE="terraform_apply_output.log"

# Change to the directory where Terraform files are located
cd "$TF_DIR" || { echo "Directory $TF_DIR not found"; exit 1; }

# Initialize Terraform
echo "Initializing Terraform in directory: $TF_DIR..."
terraform init

# Plan with the specified environment variable
# echo "Running Terraform plan for environment: $TF_VAR_environment..."
# terraform plan -var-file="../$TF_VAR_environment.tfvars"

# Apply with the specified environment variable and auto-approve, saving output to a file
echo "Applying Terraform configuration for environment: $TF_VAR_environment..."
terraform apply -var-file="../$TF_VAR_environment.tfvars" -auto-approve | tee "$LOG_FILE"

# Optional: Destroy with the specified environment variable and auto-approve
# echo "Destroying Terraform resources for environment: $TF_VAR_environment..."
# terraform destroy -var-file="../$TF_VAR_environment.tfvars" -auto-approve | tee -a "$LOG_FILE"
