<<<<<<< HEAD
=======
<<<<<<<< HEAD:helper/delete_all_rg_except.sh
APP_PATH="/mnt/c/Users/harit/Documents/Visual Studio 2022/DevOps/DevOps-Terraform-Sample/helper"

# 1. Navigate to the directory where the Dockerfile is located
echo "Navigating to $APP_PATH..."
cd "$APP_PATH" || { echo "Directory $APP_PATH not found. Exiting."; exit 1; }

az aks delete --name myakscluster --resource-group rg-dev-cluster --yes
az network watcher configure --locations eastus --enabled false
az group delete --name NetworkWatcherRG --yes --no-wait

az monitor log-analytics workspace delete --resource-group MA_defaultazuremonitorworkspace-eus_eastus_managed --workspace-name defaultazuremonitorworkspace-eus --yes


# Define the list of resource groups you want to keep
KEEP_RGS=("rg-terraform-backend" "rg-to-keep-2" "rg-to-keep-3")

# Get the list of all resource groups
# ALL_RGS=$(az group list --query "[].name" -o tsv)
ALL_RGS=$(az group list --query "[].name" -o tsv | tr -d '\r')

# Loop through all resource groups and delete the ones that are NOT in the KEEP_RGS list
for rg in $ALL_RGS; do
  if [[ ! " ${KEEP_RGS[@]} " =~ " ${rg} " ]]; then
    echo "Deleting resource group: $rg"
    az group delete --name "$rg" --yes
    echo "Deleted resource group: $rg"
  else
    echo "Skipping resource group: $rg"
  fi
========
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
APP_PATH="/mnt/c/Users/harit/Documents/Visual Studio 2022/DevOps/DevOps-Terraform-Sample/helper/scripts"

# 1. Navigate to the directory where the Dockerfile is located
echo "Navigating to $APP_PATH..."
cd "$APP_PATH" || { echo "Directory $APP_PATH not found. Exiting."; exit 1; }

az aks delete --name myakscluster --resource-group rg-dev-cluster --yes
az network watcher configure --locations eastus --enabled false
az group delete --name NetworkWatcherRG --yes --no-wait

az monitor log-analytics workspace delete --resource-group MA_defaultazuremonitorworkspace-eus_eastus_managed --workspace-name defaultazuremonitorworkspace-eus --yes


# Define the list of resource groups you want to keep
<<<<<<< HEAD
KEEP_RGS=("rg-terraform-backen" "rg-to-keep-2" "rg-to-keep-3")
=======
KEEP_RGS=("rg-terraform-backend" "rg-to-keep-2" "rg-to-keep-3")
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))

# Get the list of all resource groups
# ALL_RGS=$(az group list --query "[].name" -o tsv)
ALL_RGS=$(az group list --query "[].name" -o tsv | tr -d '\r')

# Loop through all resource groups and delete the ones that are NOT in the KEEP_RGS list
for rg in $ALL_RGS; do
  if [[ ! " ${KEEP_RGS[@]} " =~ " ${rg} " ]]; then
    echo "Deleting resource group: $rg"
    az group delete --name "$rg" --yes
    echo "Deleted resource group: $rg"
  else
    echo "Skipping resource group: $rg"
  fi
<<<<<<< HEAD
=======
>>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33)):helper/scripts/delete_all_rg_except.sh
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
done