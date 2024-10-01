# Copy development.tfvars values as it is under secrets in GitHub secrets as 'TFVARS' under development environment and also the same for production environment

'TFVARS'="\***_"
"_**"
"\*\*\*"

# Get the Azure credentials from 'az account login' and add each variable under individual environments.

ARM_CLIENT_ID="SECURE_VALUE"
ARM_CLIENT_SECRET="SECURE_VALUE"
ARM_TENANT_ID="SECURE_VALUE"
ARM_SUBSCRIPTION_ID="SECURE_VALUE"

# Next, to deploy the docker container in the ACR and then deploy to AKS cluster we need the below variables.

## Contains the service principal details in JSON format for logging into Azure.

AZURE_CREDENTIALS="SECURE_VALUE"

## The name of your Azure Container Registry.

REGISTRY_NAME="SECURE_VALUE"

## The username for Azure Container Registry.

REGISTRY_USERNAME="SECURE_VALUE"

## The password for Azure Container Registry.

REGISTRY_PASSWORD="SECURE_VALUE"

## The resource group for your AKS cluster.

AKS_RESOURCE_GROUP="SECURE_VALUE"

## The name of your AKS cluster.

AKS_CLUSTER_NAME="SECURE_VALUE"
