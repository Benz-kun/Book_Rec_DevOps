# cleanup.ps1
# ⚠️ Stops and deletes cost-incurring Azure resources safely

# --- CONFIGURE THESE VARIABLES ---
$RESOURCE_GROUP = "bookapp-rg"      
$AKS_NAME = "bookapp-aks"      
$ACR_NAME = "bookappacr123"       
# --------------------------------

Write-Host "Stopping all cost-incurring resources on Azure..."

# 1. Delete all Kubernetes workloads
kubectl delete all --all --ignore-not-found

# 2. Stop AKS cluster (stops VM node costs)
az aks stop --name $AKS_NAME --resource-group $RESOURCE_GROUP

# 3. Optionally delete cluster and resource group (fully stops billing)
# Uncomment these lines if you want to delete completely:
# az aks delete --name $AKS_NAME --resource-group $RESOURCE_GROUP --yes
# az group delete --name $RESOURCE_GROUP --yes --no-wait
# az acr delete --name $ACR_NAME --resource-group $RESOURCE_GROUP --yes

Write-Host "`n✅ Cleanup completed. Your cloud costs should now be zero."
