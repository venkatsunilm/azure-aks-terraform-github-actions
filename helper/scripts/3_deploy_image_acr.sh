<<<<<<< HEAD
<<<<<<< HEAD
=======
<<<<<<<< HEAD:helper/3_deploy_image_acr.sh
# Call local_env_setup.sh to export necessary environment variables
source "/mnt/c/Users/harit/Documents/Visual Studio 2022/DevOps/DevOps-Terraform-Sample/helper/0_local_env_setup.sh"

APP_PATH="/mnt/c/Users/harit/Documents/Visual Studio 2022/DevOps/DevOps-Terraform-Sample/data-upload-app/src"

# Check if SUBSCRIPTION_ID is exported correctly
if [ -z "$ARM_SUBSCRIPTION_ID" ]; then
  echo "Error: ARM_SUBSCRIPTION_ID is not set. Please ensure it is exported in local_env_setup.sh."
  exit 1
fi

# 1. Navigate to the directory where the Dockerfile is located
echo "Navigating to $APP_PATH..."
cd "$APP_PATH" || { echo "Directory $APP_PATH not found. Exiting."; exit 1; }

# 2. Build the Docker image (latest tag is implied)
echo "Building Docker image: $DOCKER_IMAGE_NAME..."
docker build -t $DOCKER_IMAGE_NAME .

# 3. Run Docker container locally (optional, for local testing)
# echo "Running Docker container locally..."
# docker run -d -p $DOCKER_PORT:$DOCKER_PORT $DOCKER_IMAGE_NAME

# 4. Check if Resource Group for ACR already exists
echo "Checking if resource group $ACR_RESOURCE_GROUP exists..."
RG_EXISTS=$(az group exists --name $ACR_RESOURCE_GROUP | tr -d '[:space:]')

if [ "$RG_EXISTS" = "false" ]; then
  echo "Creating resource group $ACR_RESOURCE_GROUP in location $LOCATION..."
  az group create --name $ACR_RESOURCE_GROUP --location $LOCATION
else
  echo "Resource group $ACR_RESOURCE_GROUP already exists."
fi

# 5. Check if ACR already exists
echo "Checking if Azure Container Registry $ACR_NAME exists..."
ACR_EXISTS=$(az acr check-name --name $ACR_NAME --query "nameAvailable" | tr -d '[:space:]')

if [ "$ACR_EXISTS" = "false" ]; then
  echo "Azure Container Registry $ACR_NAME already exists."
else
  echo "Creating Azure Container Registry $ACR_NAME..."
  az acr create --resource-group $ACR_RESOURCE_GROUP --name $ACR_NAME --sku Basic --location $LOCATION
fi

# 6. Log in to ACR
echo "Logging into Azure Container Registry $ACR_NAME..."
az acr login --name $ACR_NAME

# 7. Tag the Docker image for ACR
echo "Tagging Docker image for ACR..."
docker tag $DOCKER_IMAGE_NAME $ACR_NAME.azurecr.io/$DOCKER_IMAGE_NAME:$DOCKER_TAG

# 8. Push the Docker image to ACR
echo "Pushing Docker image to ACR..."
docker push $ACR_NAME.azurecr.io/$DOCKER_IMAGE_NAME:$DOCKER_TAG

# # 9. Verify the image is pushed
# echo "Verifying Docker image in ACR..."
# az acr repository show-tags --name $ACR_NAME --repository $DOCKER_IMAGE_NAME --output table

# 10. Verify repository images in ACR
echo "Verifying repository images in ACR..."
az acr repository list --name $ACR_NAME --output table

echo "Docker image $DOCKER_IMAGE_NAME:$DOCKER_TAG has been pushed to ACR $ACR_NAME.azurecr.io."

# Output helpful info for further steps
echo "Use the following to integrate with AKS:"
echo "ACR Registry: $ACR_NAME"
echo "AKS Cluster: $AKS_CLUSTER_NAME"
echo "AKS Resource Group: $AKS_RESOURCE_GROUP"

# 11. Check if ACR is already attached to AKS Cluster
echo "Checking if ACR $ACR_NAME is already attached to AKS cluster $AKS_CLUSTER_NAME..."
# Fetch AKS managed identity or SP object ID
AKS_IDENTITY_PRINCIPAL=$(az aks show --name $AKS_CLUSTER_NAME --resource-group $AKS_RESOURCE_GROUP --query identity.principalId --output tsv)

# Check if AcrPull role is already assigned to the AKS managed identity
ACR_SCOPE="/subscriptions/$ARM_SUBSCRIPTION_ID/resourceGroups/$ACR_RESOURCE_GROUP/providers/Microsoft.ContainerRegistry/registries/$ACR_NAME"
ROLE_ASSIGNED=$(az role assignment list --assignee $AKS_IDENTITY_PRINCIPAL --scope $ACR_SCOPE --query "[?roleDefinitionName=='AcrPull']" --output tsv)

if [ -n "$ROLE_ASSIGNED" ]; then
  echo "AKS cluster $AKS_CLUSTER_NAME is already authorized to pull from ACR $ACR_NAME."
else
  echo "Attaching ACR $ACR_NAME to AKS cluster $AKS_CLUSTER_NAME..."
  az aks update -n $AKS_CLUSTER_NAME -g $AKS_RESOURCE_GROUP --attach-acr $ACR_NAME
fi

# Optional: Helm deployment step if you want to run it after the AKS and ACR configuration
# cd ../deployment
# helm upgrade --install data-upload-app ./app-chart --values ./app-chart/dev-values.yaml
========
# Call local_env_setup.sh to export necessary environment variables
# source "/mnt/c/Users/harit/Documents/Visual Studio 2022/DevOps/DevOps-Terraform-Sample/helper/scripts/0_local_env_setup.sh"

>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
=======
>>>>>>> 2e4e7e2 (Feat(cicd_new_design): Implement Full CI/CD Pipeline with Dynamic Environment Support and Reusable Actions (#44))
# APP_PATH="/mnt/c/Users/harit/Documents/Visual Studio 2022/DevOps/DevOps-Terraform-Sample/data-upload-app/src"

# Check if SUBSCRIPTION_ID is exported correctly
if [ -z "$ARM_SUBSCRIPTION_ID" ]; then
  echo "Error: ARM_SUBSCRIPTION_ID is not set. Please ensure it is exported in local_env_setup.sh."
  exit 1
fi

# 1. Navigate to the directory where the Dockerfile is located
echo "Navigating to $APP_PATH..."
cd "$APP_PATH" || { echo "Directory $APP_PATH not found. Exiting."; exit 1; }

# Debugging: Display Docker info before the build
docker info

# 2. Build the Docker image (latest tag is implied)
echo "Building Docker image: $DOCKER_IMAGE_NAME"
docker buildx build -t $DOCKER_IMAGE_NAME .

# 3. Run Docker container locally (optional, for local testing)
# echo "Running Docker container locally..."
# docker run -d -p $DOCKER_PORT:$DOCKER_PORT $DOCKER_IMAGE_NAME

# 4. Check if Resource Group for ACR already exists
az account show
echo "Checking if resource group $ACR_RESOURCE_GROUP exists..."
RG_EXISTS=$(az group exists --name $ACR_RESOURCE_GROUP | tr -d '[:space:]')

if [ "$RG_EXISTS" = "false" ]; then
  echo "Creating resource group $ACR_RESOURCE_GROUP in location $LOCATION..."
  az group create --name $ACR_RESOURCE_GROUP --location $LOCATION
else
  echo "Resource group $ACR_RESOURCE_GROUP already exists."
fi

# 5. Check if ACR already exists
echo "Checking if Azure Container Registry $ACR_NAME exists..."
ACR_EXISTS=$(az acr check-name --name $ACR_NAME --query "nameAvailable" | tr -d '[:space:]')

if [ "$ACR_EXISTS" = "false" ]; then
  echo "Azure Container Registry $ACR_NAME already exists."
else
  echo "Creating Azure Container Registry $ACR_NAME..."
  az acr create --resource-group $ACR_RESOURCE_GROUP --name $ACR_NAME --sku Basic --location $LOCATION
fi

# 6. Log in to ACR
echo "Logging into Azure Container Registry $ACR_NAME..."
az acr login --name $ACR_NAME

# 7. Tag the Docker image for ACR
echo "Tagging Docker image for ACR..."
docker tag $DOCKER_IMAGE_NAME $ACR_NAME.azurecr.io/$DOCKER_IMAGE_NAME:$DOCKER_TAG

# 8. Push the Docker image to ACR
echo "Pushing Docker image to ACR..."
docker push $ACR_NAME.azurecr.io/$DOCKER_IMAGE_NAME:$DOCKER_TAG

# # 9. Verify the image is pushed
# echo "Verifying Docker image in ACR..."
# az acr repository show-tags --name $ACR_NAME --repository $DOCKER_IMAGE_NAME --output table

# 10. Verify repository images in ACR
echo "Verifying repository images in ACR..."
az acr repository list --name $ACR_NAME --output table

echo "Docker image $DOCKER_IMAGE_NAME:$DOCKER_TAG has been pushed to ACR $ACR_NAME.azurecr.io."

# Output helpful info for further steps
echo "Use the following to integrate with AKS:"
echo "ACR Registry: $ACR_NAME"
echo "AKS Cluster: $AKS_CLUSTER_NAME"
echo "AKS Resource Group: $AKS_RESOURCE_GROUP"

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 2e4e7e2 (Feat(cicd_new_design): Implement Full CI/CD Pipeline with Dynamic Environment Support and Reusable Actions (#44))
echo "Attaching ACR $ACR_NAME to AKS cluster $AKS_CLUSTER_NAME..."
# Assign the 'User Access Administrator' role at the 'rg-acr-prod' level
az role assignment create \
  --assignee $ARM_CLIENT_ID \
  --role "User Access Administrator" \
<<<<<<< HEAD
<<<<<<< HEAD
  --scope "/subscriptions/$ARM_SUBSCRIPTION_ID/resourceGroups/$ACR_RESOURCE_GROUP"
az aks update -n $AKS_CLUSTER_NAME -g $AKS_RESOURCE_GROUP --attach-acr $ACR_NAME
=======
# 11. Check if ACR is already attached to AKS Cluster
echo "Checking if ACR $ACR_NAME is already attached to AKS cluster $AKS_CLUSTER_NAME..."
# Fetch AKS managed identity or SP object ID
AKS_IDENTITY_PRINCIPAL=$(az aks show --name $AKS_CLUSTER_NAME --resource-group $AKS_RESOURCE_GROUP --query identity.principalId --output tsv)

# Check if AcrPull role is already assigned to the AKS managed identity
ACR_SCOPE="/subscriptions/$ARM_SUBSCRIPTION_ID/resourceGroups/$ACR_RESOURCE_GROUP/providers/Microsoft.ContainerRegistry/registries/$ACR_NAME"
ROLE_ASSIGNED=$(az role assignment list --assignee $AKS_IDENTITY_PRINCIPAL --scope $ACR_SCOPE --query "[?roleDefinitionName=='AcrPull']" --output tsv)

if [ -n "$ROLE_ASSIGNED" ]; then
  echo "AKS cluster $AKS_CLUSTER_NAME is already authorized to pull from ACR $ACR_NAME."
else
  echo "Attaching ACR $ACR_NAME to AKS cluster $AKS_CLUSTER_NAME..."
  az aks update -n $AKS_CLUSTER_NAME -g $AKS_RESOURCE_GROUP --attach-acr $ACR_NAME
fi
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
=======
  --scope "/subscriptions/$ARM_SUBSCRIPTION_ID>/resourceGroups/$ACR_RESOURCE_GROUP"
=======
  --scope "/subscriptions/$ARM_SUBSCRIPTION_ID/resourceGroups/$ACR_RESOURCE_GROUP"
>>>>>>> 6d3e536 (Feat(helm_aks): Switch to Standard_B2s VM for Development and Integrate Helm with AKS )
az aks update -n $AKS_CLUSTER_NAME -g $AKS_RESOURCE_GROUP --attach-acr $ACR_NAME
>>>>>>> 2e4e7e2 (Feat(cicd_new_design): Implement Full CI/CD Pipeline with Dynamic Environment Support and Reusable Actions (#44))

# Optional: Helm deployment step if you want to run it after the AKS and ACR configuration
# cd ../deployment
# helm upgrade --install data-upload-app ./app-chart --values ./app-chart/dev-values.yaml
<<<<<<< HEAD
=======
>>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33)):helper/scripts/3_deploy_image_acr.sh
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
