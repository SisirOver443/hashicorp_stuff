resource "azurerm_resource_group" "consul-resource-group" {
  name = "${var.resource_group_name}"
  location = "${var.location}"
}

module "vnet" {
    source = "./modules/networks"
    resource_group_name = azurerm_resource_group.consul-resource-group.name
    network_name = "${var.virtual_network_name}"
    location = azurerm_resource_group.consul-resource-group.location
    network_cidr = "${var.virtual_network_cidr}"
}
