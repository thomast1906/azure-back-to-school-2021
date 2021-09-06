output "vnet_id" {
  value = azurerm_virtual_network.hub_virtual_network.id
}

output "resource_group" {
  value = azurerm_resource_group.hub_resource_group.name
}

output "vnet_name" {
  value = azurerm_virtual_network.hub_virtual_network.name
}