// Primary Bicep Deployment File. This file will call bicep modules as required.
// All bicep modules will be stored in .\modules\

// Resources to be deployed:
//    Security VNET
//    AzureFirewallSubnet
//    Production VNET
//    App Gateway Subnet
//    Private Endpoint Subnet
//    AKS Production Subnet
//    AKS Acceptance Subnet
//    AKS Test Subnet
//    AKS Cluster
//    App Gateway
//    Log Analytics/Container Insights
//    Azure Container Registry

targetScope = 'subscription'

param secEnvironment string = 'security'
param environment string
param location string = 'northeurope'
param resourcePrefix string = 'azback2shcool'

param vnets array = [
  {
    name: 'vnet-${customer}-${secEnvironment}'
    addressSpace: '10.99.0.0/16'
  }
  {
    name: 'vnet-${customer}-production'
    addressSpace: '10.0.0.0/16'
  }
  {
    name: 'vnet-${customer}-accept'
    addressSpace: '10.1.0.0/16'
  }
  {
    name: 'vnet-${customer}-test'
    addressSpace: '10.2.0.0/16'
  }
]

param secSubnets array = [
  {
    name: 'AzureFirewallSubnet'
    ipAddressRange: '10.99.99.0/26'
  }
]

param prodSubnets array = [
  {
    name: 'snet-${customer}-aks'
    ipAddressRange: '10.99.99.0/26'
  }
  {
    name: 'snet-${customer}-backend'
    ipAddressRange: '10.99.99.0/26'
  }
]

param resourceGroups array = [
  'security'
  'aks-prod'
  'aks-nodes-prod'
  'aks-accept'
  'aks-nodes-accept'
  'aks-test'
  'aks-nodes-test'
]

resource NewRG 'Microsoft.Resources/resourceGroups@2020-06-01' = [for name in resourceGroups: {
  name: 'rg-${resourcePrefix}-${name}'
  location: location
}]
