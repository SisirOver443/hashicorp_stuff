resource "azurerm_resource_group" "consul-resource-group" {
  name = "${var.resource_group_name}"
  location = "${var.location}"
}

module "networks" {
    source = "./modules/networks"
    resource_group_name = azurerm_resource_group.consul-resource-group.name
    network_name = "${var.virtual_network_name}"
    location = azurerm_resource_group.consul-resource-group.location
    network_cidr = "${var.virtual_network_cidr}"
}

module "consul-server" {
  source = "./modules/compute"
  resource_group_name = azurerm_resource_group.consul-resource-group.name
  default-subnet-id = module.networks.default-subnet-id
  network_name = "${var.virtual_network_name}"
  location = azurerm_resource_group.consul-resource-group.location
  network_cidr = "${var.virtual_network_cidr}"
  consul_server_vm_name = "${var.server_vm_name}"
  vm_server_size = "${var.vm_server_size}"
  depends_on = [ module.networks ]
}
