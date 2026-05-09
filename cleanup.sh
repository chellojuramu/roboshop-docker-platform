# Delete main Resource Group (removes AKS, ACR, everything)
az group delete --name ecommerce-demo --yes --no-wait

# Delete auto-generated RG (optional)
az group delete --name MC_ecommerce-demo_roboshop_westus2 --yes --no-wait

# Clean local kubectl config
kubectl config delete-context roboshop 2>/dev/null || true
kubectl config delete-cluster roboshop 2>/dev/null || true
kubectl config unset users."clusterUser_ecommerce-demo_roboshop" 2>/dev/null || true