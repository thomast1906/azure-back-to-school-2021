# azure-back-to-school-2021

Topic 1:- From zero to GitOps with AKS (1 hour in total - slides & video/demo etc)


- AKS Deployment with TF/Bicep/CLI - Bicep preferable
- AKS security/Azure Policy
- GitOps
  - Fluxv2
  - Helm
  - Kustomize
  - Renovate
- Benefits of GitOps
  - Brings infra closer to dev
- All this in pipeline(s) etc (automated)
Demo of old helm charts etc to show the benefits of helm/renovate/flux!


####################################################
Topic:- From zero to GitOps with AKS (1 hour in total - slides & video/demo etc)

## SlideDeck

- Intro of us, #AzureBacktoSchool
- Intro of K8s
  - Why K8s etc
  - - Azure AKS
- GitOps
  - What is it?
  - More than than just a buzzword
  - Fluxv2 & Microsoft integration (link of to MS doc)
  - Kustomize
  - Helm
  - Renovate (possibly)
- Diagram of what we will cover in the session
  - Visio/draw.io of Azure infrastructure
  - Some sort of diagram to show GitOps integration
  - Azure Pipeline(s)
**- Demo time**
- What we achieved
- Learn more, going forward
- Thank you etc

## Code

### Terraform

- Networking ( Hub/Spoke? Azure Firewall, NAT'd to App GW possibly)
  - Route Table(s)
- Log Analytics
- Azure AKS Service
- Azure Container Registry** (potentially if we go Image Automation with fluxv2) 

### Azure Bicep

- Networking ( Hub/Spoke? Azure Firewall, NAT'd to App GW possibly)
  - Route Table(s)
- Log Analytics
- Azure AKS Service
- Azure Container Registry** (potentially if we go Image Automation with fluxv2) 


### Azure Pipelines

- Pipeline to deploy Terraform &/or Azure Bicep
 - Using Template(s) to decide if its Terraform or Bicep
- LintTesting*
- Terraform plan & Azure Bicep plan stage
- Bootstrap AKS cluster using Azure CLI


### Flux v2

- Repo setup for fluxv2
- Ability to deploy to two clusters
  - Develop
  - Production
- What will Flux Install? (Via HelmReleases)
  - Simple App
  - Prometheous
- Show some benefits of fluxv2/Helm
- CI Check?*

### Nice to haves
- AKS security/Azure Policy
- CI/CD (images to Azure Container Registry?)
