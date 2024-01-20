resource "azurerm_subnet" "gateway-subnet" {
  name = "${var.gateway_subnet_name}"
  virtual_network_name = var.network_name
  resource_group_name = var.resource_group_name
  address_prefixes = [cidrsubnet(element(var.network_cidr, 0), 8, 0)]
  depends_on = [ azurerm_virtual_network.vnet ]
}

resource "azurerm_subnet" "default" {
  name = "${var.default_subnet_name}"
  virtual_network_name = var.network_name
  resource_group_name = var.resource_group_name
  address_prefixes = [cidrsubnet(element(var.network_cidr, 0), 8, 1)]
  depends_on = [ azurerm_virtual_network.vnet ]
}

output "default-subnet-id" {
  value = azurerm_subnet.default.id
}