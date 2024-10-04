# Variables
ACR_NAME="venkatsunilm"
ACR_RESOURCE_GROUP="rg-acr-development"
AKS_RESOURCE_GROUP="rg-development"
AKS_CLUSTER_NAME="aks-development"
LOCATION="eastus"
IMAGE_NAME="data-upload-webapp"
TAG="latest"
PORT=8000
WEBAPP_PATH="/mnt/c/Users/harit/Documents/Visual Studio 2022/DevOps/DevOps-Terraform-Sample/src/webapp"  # Relative path to your Dockerfile location

# 1. Navigate to the directory where the Dockerfile is located
echo "Navigating to $WEBAPP_PATH..."
cd "$WEBAPP_PATH" || { echo "Directory $WEBAPP_PATH not found. Exiting."; exit 1; }

# 2. Build the Docker image (latest tag is implied)
echo "Building Docker image: $IMAGE_NAME..."
docker build -t $IMAGE_NAME .

# 3. Run Docker container locally (optional, for local testing)
echo "Running Docker container locally..."
docker run -d -p $PORT:$PORT $IMAGE_NAME

# 4. Check if Resource Group for ACR already exists
echo "Checking if resource group $ACR_RESOURCE_GROUP exists..."
RG_EXISTS=$(az group exists --name $ACR_RESOURCE_GROUP)

if [ "$RG_EXISTS" = "false" ]; then
  echo "Creating resource group $ACR_RESOURCE_GROUP in location $LOCATION..."
  az group create --name $ACR_RESOURCE_GROUP --location $LOCATION
else
  echo "Resource group $ACR_RESOURCE_GROUP already exists."
fi

# 5. Check if ACR already exists
echo "Checking if Azure Container Registry $ACR_NAME exists..."
ACR_EXISTS=$(az acr check-name --name $ACR_NAME --query "nameAvailable")

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
docker tag $IMAGE_NAME $ACR_NAME.azurecr.io/$IMAGE_NAME:$TAG

# 8. Push the Docker image to ACR
echo "Pushing Docker image to ACR..."
docker push $ACR_NAME.azurecr.io/$IMAGE_NAME:$TAG

# 9. Verify the image is pushed
echo "Verifying Docker image in ACR..."
az acr repository show-tags --name $ACR_NAME --repository $IMAGE_NAME --output table

# 10. Verify repository images in ACR
echo "Verifying repository images in ACR..."
az acr repository list --name $ACR_NAME --output table

echo "Docker image $IMAGE_NAME:$TAG has been pushed to ACR $ACR_NAME.azurecr.io."

# Output helpful info for further steps
echo "Use the following to integrate with AKS:"
echo "ACR Registry: $ACR_NAME"
echo "AKS Cluster: $AKS_CLUSTER_NAME"
echo "AKS Resource Group: $AKS_RESOURCE_GROUP"

# 11. Attach ACR to AKS Cluster
# echo "Attaching ACR $ACR_NAME to AKS cluster $AKS_CLUSTER_NAME..."
# az aks update -n $AKS_CLUSTER_NAME -g $AKS_RESOURCE_GROUP --attach-acr $ACR_NAME

# cd ../../modules/webapp

# helm upgrade --install data-upload-webapp ./data-upload-webapp-chart --values ./data-upload-webapp-chart/development-values.yaml
