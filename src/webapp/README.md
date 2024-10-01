# Create docker image and container

docker build -t data-upload-webapp .
docker run -d -p 8000:8000 data-upload-webapp

# Create RG

az group create --name rg-acr-vsm --location eastus

# Login and create ACR

az acr login --name venkatsunilm
az acr create --resource-group rg-acr-vsm --name venkatsunilm --sku Basic

# Push Docker Image to Container Registry:

docker tag data-upload-webapp venkatsunilm.azurecr.io/data-upload-webapp:latest
docker push venkatsunilm.azurecr.io/data-upload-webapp:latest
