
MI_NAME="azurebacktoschool"

# Create Resource Group for Managed Identity
az group create -l uksouth -n "$MI_NAME-mi-rg"

# Create Managed Identity
az identity create -n "$MI_NAME-mi" -g "$MI_NAME-mi-rg" -l uksouth

# Give Managed Identity Subscription Contributor access
# Take clientID from above Managed Identity for --asignee
az role assignment create --assignee "f520b70e-8003-4d01-aad4-f51f78cb0ec8" --role "Contributor" --subscription "04109105-f3ca-44ac-a3a7-66b4936112c3"

# Create KeyVAULT for BootStrap Creds
az keyvault create -n "$MI_NAME-kv" -g "$MI_NAME-mi-rg" -l uksouth
az keyvault secret set --vault-name "$MI_NAME-kv" --name "GITHUB-USER" --value "thomast1906"
az keyvault secret set --vault-name "$MI_NAME-kv" --name "GITHUB-TOKEN" --value ""
