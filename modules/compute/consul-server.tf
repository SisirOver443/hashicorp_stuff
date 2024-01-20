resource "azurerm_network_interface" "consul-server-nic" {
  resource_group_name = "${var.resource_group_name}"
  name = "${var.consul_server_vm_name}-nic"
  location = "${var.location}"
  ip_configuration {
    name  = "ipconfig-1"
    subnet_id = "${var.default-subnet-id}"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "consul-server-vm" {
  resource_group_name = "${var.resource_group_name}"
  name = "${var.consul_server_vm_name}"
  location = "${var.location}"
  storage_image_reference {
    publisher = "erockyenterprisesoftwarefoundationinc1653071250513"
    offer = "rockylinux"
    sku = "free"
    version = "latest"
  }
  plan {
    name =  "rockylinux"
    publisher = "erockyenterprisesoftwarefoundationinc1653071250513"
    product = "rockylinux"
  }
  storage_os_disk {
    name = "${var.consul_server_vm_name}-storagedisk"
    create_option = "FromImage"
  }
  network_interface_ids = [ azurerm_network_interface.consul-server-nic.id ]
  vm_size = "${var.vm_server_size}"
}