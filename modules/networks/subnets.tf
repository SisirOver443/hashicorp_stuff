resource "azurerm_subnet" "private" {
  for_each = var.private_subnets
  name = each.key
  virtual_network_name = var.network_name
  resource_group_name = var.resource_group_name
  address_prefixes = [cidrsubnet(element(var.network_cidr, 0), 8, each.value)]
  depends_on = [ azurerm_virtual_network.vnet ]
}