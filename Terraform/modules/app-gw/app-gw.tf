resource "azurerm_public_ip" "appgwpip" {
    name                         = "appgwpip"
    location                     = var.location
    resource_group_name          = var.app_gw_resource_group_name
    allocation_method            = "Static"
    sku                          = "Standard"

      tags = {
    Environment = var.environment
  }

}

resource "azurerm_application_gateway" "aks-appgw" {
    name                = var.app_gw_name
    resource_group_name = var.app_gw_resource_group_name
    location            = var.location

    sku {
    name     = var.app_gateway_sku
    tier     = "Standard_v2"
    capacity = 2
    }

    gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = var.app_gateway_subnet_id
    }

    frontend_port {
    name = local.frontend_port_name
    port = 80
    }

    frontend_port {
    name = "httpsPort"
    port = 443
    }

    frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.appgwpip.id
    }

    backend_address_pool {
    name = local.backend_address_pool_name
    }

    backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 1
    }

    http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
    }

    request_routing_rule {
    name                       = local.request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
    }

  tags = {
    Environment = var.environment
  }

}