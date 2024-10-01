## How to run terrafom locally

# Go to working directory

working-directory: environments/shared
export TF_VAR_environment="development"

# Terraform init

terraform init

# Terraform Plan

terraform plan -var-file="../$TF_VAR_environment.tfvars"

# Terraform Apply

terraform apply -var-file="../$TF_VAR_environment.tfvars" -auto-approve

# Terraform Destroy

terraform destroy -var-file="../$TF_VAR_environment.tfvars" -auto-approve
