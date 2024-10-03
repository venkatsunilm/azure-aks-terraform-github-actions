# Create docker image and container

docker build -t data-upload-webapp .
docker run -d -p 8000:8000 data-upload-webapp

# Create RG

az group create --name rg-acr-development --location eastus

# Login and create ACR

az acr login --name venkatsunilm
az acr create --resource-group rg-acr-development --name venkatsunilm --sku Basic

# Push Docker Image to Container Registry:

docker tag data-upload-webapp venkatsunilm.azurecr.io/data-upload-webapp:latest
docker push venkatsunilm.azurecr.io/data-upload-webapp:latest

<!-- acr_registry_name = "venkatsunilm"
aks_cluster_name = "aks-development"
aks_rg_name = "rg-development" -->
