# Call local_env_setup.sh to export necessary environment variables
source "/mnt/c/Users/harit/Documents/Visual Studio 2022/DevOps/DevOps-Terraform-Sample/helper/scripts/0_local_env_setup.sh"

<<<<<<< HEAD
<<<<<<< HEAD
# Set common directories for Terraform
TF_INFRA_DIR="/mnt/c/Users/harit/Documents/Visual Studio 2022/DevOps/DevOps-Terraform-Sample/azure-platform/deployment"
TF_APP_DIR="/mnt/c/Users/harit/Documents/Visual Studio 2022/DevOps/DevOps-Terraform-Sample/data-upload-app/deployment"

# Function to run Terraform destroy command
run_terraform_destroy() {
  local dir="$1"
  
  # Check if the directory exists
  if [ ! -d "$dir" ]; then
    echo "Directory $dir not found"
    exit 1
  fi

  # Change to the directory
  cd "$dir" || { echo "Failed to change directory to $dir"; exit 1; }

  # Apply with the specified environment variable and auto-approve
  echo "Applying Terraform destroy for environment: $TF_VAR_environment in $dir"
  if ! terraform destroy -var-file="./$TF_VAR_environment.tfvars" -auto-approve; then
    echo "Terraform destroy failed in $dir!"
    exit 1
  fi
}

# Set the environment variable (default to "dev" if not set)
export TF_VAR_environment="${TF_VAR_environment:-dev}"

# Run Terraform destroy for both infrastructure and application directories
run_terraform_destroy "$TF_INFRA_DIR"
run_terraform_destroy "$TF_APP_DIR"

# Run the script to delete all resource groups except the state file
echo "Running resource group cleanup script..."
/mnt/c/Users/harit/Documents/Visual Studio 2022/DevOps/DevOps-Terraform-Sample/helper/scripts/delete_all_rg_except.sh

echo "Terraform destroy and resource group cleanup completed successfully."
=======
TF_APP_DIR="/mnt/c/Users/harit/Documents/Visual Studio 2022/DevOps/DevOps-Terraform-Sample/data-upload-app/deployment"

# Change to the directory where Terraform files are located
cd "$TF_APP_DIR" || { echo "Directory $TF_APP_DIR not found"; exit 1; }

# Apply with the specified environment variable and auto-approve, saving output to a file
echo "Applying Terraform configuration for environment: $TF_VAR_environment"
if ! terraform destroy -var-file="./$TF_VAR_environment.tfvars" -auto-approve; then
  echo "Terraform apply failed!"
  exit 1
fi

=======
>>>>>>> f27cb71 (Fix(Helper_scripts): few tweaks to correct the destroy flow (#36))
# Directory to run Terraform commands
TF_INFRA_DIR="/mnt/c/Users/harit/Documents/Visual Studio 2022/DevOps/DevOps-Terraform-Sample/azure-platform/deployment"

# Set the environment variable to dev
# export TF_VAR_environment="dev"

# Change to the directory where Terraform files are located
cd "$TF_INFRA_DIR" || { echo "Directory $TF_INFRA_DIR not found"; exit 1; }

# Apply with the specified environment variable and auto-approve, saving output to a file
echo "Applying Terraform configuration for environment: $TF_VAR_environment"
if ! terraform destroy -var-file="./$TF_VAR_environment.tfvars" -auto-approve -lock=false; then
  echo "Terraform apply failed!"
  exit 1
fi

<<<<<<< HEAD
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
=======
TF_APP_DIR="/mnt/c/Users/harit/Documents/Visual Studio 2022/DevOps/DevOps-Terraform-Sample/data-upload-app/deployment"

# Change to the directory where Terraform files are located
cd "$TF_APP_DIR" || { echo "Directory $TF_APP_DIR not found"; exit 1; }

# Apply with the specified environment variable and auto-approve, saving output to a file
echo "Applying Terraform configuration for environment: $TF_VAR_environment"
if ! terraform destroy -var-file="./$TF_VAR_environment.tfvars" -auto-approve -lock=false; then
  echo "Terraform apply failed!"
  exit 1
fi

<<<<<<< HEAD

>>>>>>> f27cb71 (Fix(Helper_scripts): few tweaks to correct the destroy flow (#36))
=======
../../helper/scripts/delete_all_rg_except.sh 
>>>>>>> 648ec81 (Fix(Helper_scripts): few tweaks to correct the destroy flow (#36) (#37))
