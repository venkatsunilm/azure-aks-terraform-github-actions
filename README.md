# azure-aks-terraform-github-actions-helm

## Overview
This project involves infrastructure provisioning using **Terraform** and application deployment with **Helm** on **Azure Kubernetes Service (AKS)**. The project is structured to separate the management of infrastructure and application deployment, with clear environment-specific configurations for development and production environments.

## Directory Structure

### 1. Workflows Directory
This directory contains the CI/CD pipeline configuration files for both infrastructure and application deployment.

- **deploy-infra-cicd.yml**: Manages the infrastructure provisioning workflow, including the deployment of AKS, ACR, networking, and storage resources.
- **deploy-app-cicd.yml**: Handles the application deployment workflow using Helm, ensuring the web app is properly deployed to AKS.

### 2. Modules Directory
This directory holds the Terraform modules for deploying specific infrastructure components.

- **acr/**: Deploys Azure Container Registry (ACR) to store Docker images.
- **aks/**: Deploys Azure Kubernetes Service (AKS) for running the containerized web app.
- **networking/**: Configures Virtual Networks (VNets) and related networking resources.
- **storage/**: Provisions Azure Storage resources for application data or other infrastructure needs.

### 3. Deployment Directory
Contains the main Terraform configuration files that define and manage the infrastructure deployment process.

- **main.tf**: The entry point for Terraform, which ties together the modules and manages resource dependencies.
- **variables.tf**: Defines variables that are used across the Terraform configuration for flexibility and reusability.
- **outputs.tf**: Specifies the output variables, such as the AKS cluster name or public IP, that are available after the infrastructure is provisioned.
- **development.tfvars** and **production.tfvars**: Environment-specific variable files for development and production, ensuring that different configurations can be applied depending on the environment.

### 4. Webapp Helm Chart
This directory holds the Helm chart for deploying the web application to AKS.

- **webapp-chart/**: Helm chart directory containing Kubernetes manifest templates for the web application deployment.
- **Chart.yaml**: The metadata file that defines the Helm chart's version, name, and dependencies.
- **development-values.yaml**: Values file containing configurations specific to the development environment.
- **production-values.yaml**: Values file containing configurations specific to the production environment.

### 5. Source Code (src)
This directory contains the application's source code and associated resources.

- **app.py**: The main Python file that contains the web application code.
- **Dockerfile**: Defines the instructions to build the Docker image for the web application.
- **data_export.sh**: A shell script used for exporting data.
- **requirements.txt**: Lists the Python dependencies required by the web application.

## How to Use

### Prerequisites
- **Azure Account**: You need an active Azure account to provision resources like AKS and ACR.
- **Terraform**: Install [Terraform](https://www.terraform.io/downloads) to manage infrastructure.
- **Helm**: Install [Helm](https://helm.sh/docs/intro/install/) to deploy the web app.
- **Azure CLI**: Install [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) to interact with Azure services.

### Steps to Deploy

#### 1. Infrastructure Provisioning:
1. Clone this repository.
2. Navigate to the `deployment` directory.
3. Run Terraform commands:
   ```bash
   terraform init
   terraform plan -var-file=development.tfvars
   terraform apply -var-file=development.tfvars
   ```
4. This will provision AKS, ACR, and other necessary infrastructure resources.

#### 2. Application Deployment:
1. After the infrastructure is set up, navigate to the `src` folder to build and push the Docker image:
   ```bash
   docker build -t <acr_registry_name>.azurecr.io/data-upload-webapp:latest .
   docker push <acr_registry_name>.azurecr.io/data-upload-webapp:latest
   ```
2. Navigate to the `webapp-chart` directory.
3. Use Helm to deploy the application:
   ```bash
   helm upgrade --install data-upload-webapp ./webapp-chart --values ./webapp-chart/development-values.yaml
   ```

### CI/CD Pipeline
The project includes two CI/CD pipelines:

1. **Infrastructure CI/CD (deploy-infra-cicd.yml)**: This pipeline automates the provisioning of infrastructure using Terraform.
2. **Application CI/CD (deploy-app-cicd.yml)**: This pipeline automates the build, push, and deployment of the web application using Docker and Helm.

### Environment-Specific Configurations
- **Development**: Use `development.tfvars` and `development-values.yaml` for development environment deployment.
- **Production**: Use `production.tfvars` and `production-values.yaml` for production environment deployment.

## License
This project is licensed under the MIT License.
