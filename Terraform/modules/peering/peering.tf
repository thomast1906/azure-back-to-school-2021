resource "azurerm_virtual_network_peering" "peer-1" {
  name                      = var.peer1_name
  resource_group_name       = var.peer1_vnet_resource_group
  virtual_network_name      = var.peer1_vnet_name
  remote_virtual_network_id = var.peer1_vnet_remote_id
}

resource "azurerm_virtual_network_peering" "peer-2" {
  name                      = var.peer2_name
  resource_group_name       = var.peer2_vnet_resource_group
  virtual_network_name      = var.peer2_vnet_name
  remote_virtual_network_id = var.peer2_vnet_remote_id
}
