
# module "appgw" {
#     source             = "./modules/app-gw"
#   app_gw_name             = "thomasappgw"
#   location           = "uksouth"
# app_gw_resource_group_name = module.vnet_aks.resource_group
# app_gateway_sku = "Standard_v2"
# app_gateway_subnet_id = module.vnet_aks.appgw_subnet_id
# }


# module "hub" {
#   source             = "./modules/hub"
#   hub_name               = "thomashub"
#   location           = "uksouth"
#    network_address_space                  = "10.0.0.0/16"
#   firewall_subnet_address_prefix = "10.0.0.0/24"
#   firewall_name = "tamopsfw"
# }


# module "peering" {

# source = "./modules/peering"

# peer1_name   = "aks2hub"
# peer1_vnet_resource_group = module.vnet_aks.resource_group
# peer1_vnet_name = module.vnet_aks.vnet_name
# peer1_vnet_remote_id = module.hub.vnet_id

# peer2_name   = "aks2hub"
# peer2_vnet_resource_group = module.hub.resource_group
# peer2_vnet_name = module.hub.vnet_name
# peer2_vnet_remote_id = module.vnet_aks.vnet_id

# }