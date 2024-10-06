# Call local_env_setup.sh to export necessary environment variables
source "/mnt/c/Users/harit/Documents/Visual Studio 2022/DevOps/DevOps-Terraform-Sample/helper/0_local_env_setup.sh"

# Check if AKS_CLUSTER_NAME is exported correctly
if [ -z "$AKS_CLUSTER_NAME" ]; then
  echo "Error: AKS_CLUSTER_NAME is not set. Please ensure it is exported in local_env_setup.sh."
  exit 1
fi

HOME="/mnt/c/Users/harit"
KUBECONFIG_PATH="$HOME/.kube/config"  # Default kubeconfig path (you can adjust if needed)

# 1. Get AKS Credentials
echo "Fetching AKS credentials for cluster $AKS_CLUSTER_NAME in resource group $AKS_RESOURCE_GROUP..."
az aks get-credentials --resource-group $AKS_RESOURCE_GROUP --name $AKS_CLUSTER_NAME --admin --overwrite-existing

export KUBECONFIG=$HOME/.kube/config
export KUBE_CONFIG_PATH=$HOME/.kube/config

# 2. Get available Kubernetes Context
kubectl config get-contexts

# 3. Set and Verify the Kubernetes Context
echo "Setting Kubernetes context to $AKS_CLUSTER_NAME..."
kubectl config use-context $AKS_CLUSTER_NAME-admin

# 3. Verify the current context
echo "Verifying current Kubernetes context:"
kubectl config current-context

# 4. Check the KUBECONFIG file path
if [ -f "$KUBECONFIG" ]; then
    echo "KUBECONFIG is set to: $KUBECONFIG"
else
    echo "KUBECONFIG not found at the expected path: $KUBECONFIG"
fi

# 5. Get the nodes in the AKS cluster
echo "Fetching AKS nodes:"
kubectl get nodes

# 6. Get the pods in the current namespace
echo "Fetching pods in the current namespace:"
kubectl get pods

echo "Done."
