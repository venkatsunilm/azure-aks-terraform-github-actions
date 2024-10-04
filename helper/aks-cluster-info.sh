#!/bin/bash

# Variables
RESOURCE_GROUP="rg-development"
CLUSTER_NAME="aks-development"

# 1. Get AKS Credentials
echo "Fetching AKS credentials for cluster $CLUSTER_NAME in resource group $RESOURCE_GROUP..."
az aks get-credentials --resource-group $RESOURCE_GROUP --name $CLUSTER_NAME --yes

# 2. Display the current context
echo "Current Kubernetes context:"
kubectl config current-context

# 3. Get the nodes in the AKS cluster
echo "Fetching AKS nodes:"
kubectl get nodes

# 4. Get the pods in the AKS cluster
echo "Fetching pods in the current namespace:"
kubectl get pods

echo "Done."
