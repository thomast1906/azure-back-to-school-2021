## Code

### Terraform - Thomas

- Networking ( Hub/Spoke? Azure Firewall, NAT'd to App GW possibly)
  - Route Table(s)
- Log Analytics
- Azure AKS Service
- Azure Container Registry** (potentially if we go Image Automation with fluxv2) 

### Azure Bicep - Karl

- Networking ( Hub/Spoke? Azure Firewall, NAT'd to App GW possibly)
  - Route Table(s)
- Log Analytics
- Azure AKS Service
- Azure Container Registry** (potentially if we go Image Automation with fluxv2) 


### Azure Pipelines

- Pipeline to deploy Terraform &/or Azure Bicep - Thomas/Karl
 - Using Template(s) to decide if its Terraform or Bicep - Thomas/Karl
- LintTesting*
- Terraform plan & Azure Bicep plan stage - Thomas/Karl
- Bootstrap AKS cluster using Azure CLI - Thomas? Have a draft bootstrap
