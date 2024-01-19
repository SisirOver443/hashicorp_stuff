resource "azurerm_virtual_network" "vnet" {
  resource_group_name = "${var.resource_group_name}"
  location = "${var.location}"
  name = "${var.network_name}"
  address_space =  "${var.network_cidr}"
}