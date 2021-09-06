resource "azurerm_resource_group" "hub_resource_group" {
  location = var.location
  name     = "${var.hub_name}-rg"
  tags = {
    Environment = var.environment
  }
}

resource "azurerm_virtual_network" "hub_virtual_network" {
  name = "${var.hub_name}-vnet"
  location = var.location
  resource_group_name = azurerm_resource_group.hub_resource_group.name
  address_space = [var.network_address_space]

  tags = {
    Environment = var.environment
  }

}

resource "azurerm_subnet" "firewall_subnet" {
  name = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.hub_resource_group.name
  virtual_network_name = azurerm_virtual_network.hub_virtual_network.name
  address_prefixes = [var.firewall_subnet_address_prefix]
}

resource "azurerm_public_ip" "firewall_pip" {
  name                = "${var.firewall_name}-pip"
  location            = azurerm_resource_group.hub_resource_group.location
  resource_group_name = azurerm_resource_group.hub_resource_group.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "hub_firewall" {
  name                = var.firewall_name
  location            = azurerm_resource_group.hub_resource_group.location
  resource_group_name = azurerm_resource_group.hub_resource_group.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.firewall_subnet.id
    public_ip_address_id = azurerm_public_ip.firewall_pip.id
  }
}