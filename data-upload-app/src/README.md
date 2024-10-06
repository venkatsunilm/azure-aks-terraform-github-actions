# Create docker image and container

<<<<<<< HEAD
docker build -t data-upload-app .
docker run -d -p 8000:8000 data-upload-app

# Create RG

az group create --name rg-acr-dev --location eastus
=======
docker build -t data-upload-webapp .
docker run -d -p 8000:8000 data-upload-webapp

# Create RG

az group create --name rg-acr-development --location eastus
>>>>>>> 2c252cb (Refactor: refactoring the project as per the planned design (#28))

# Login and create ACR

az acr login --name venkatsunilm
<<<<<<< HEAD
az acr create --resource-group rg-acr-dev --name venkatsunilm --sku Basic

# Push Docker Image to Container Registry:

docker tag data-upload-app venkatsunilm.azurecr.io/data-upload-app:latest
docker push venkatsunilm.azurecr.io/data-upload-app:latest

<!-- acr_registry_name = "venkatsunilm"
aks_cluster_name = "aks-dev"
aks_rg_name = "rg-dev" -->
=======
az acr create --resource-group rg-acr-development --name venkatsunilm --sku Basic

# Push Docker Image to Container Registry:

docker tag data-upload-webapp venkatsunilm.azurecr.io/data-upload-webapp:latest
docker push venkatsunilm.azurecr.io/data-upload-webapp:latest

<!-- acr_registry_name = "venkatsunilm"
aks_cluster_name = "aks-development"
aks_rg_name = "rg-development" -->
>>>>>>> 2c252cb (Refactor: refactoring the project as per the planned design (#28))
