resource "random_string" "wvd-local-password" {
  count            = "${var.rdsh_count}"
  length           = 16
  special          = true
  min_special      = 2
  override_special = "*!@#?"
}

resource "azurerm_network_interface" "rdsh" {
  count                     = "${var.rdsh_count}"
  name                      = "${var.vm_prefix}-${count.index +1}-nic"
  location                  = "${var.region}"
  resource_group_name       = "${var.resource_group_name}"
 
  ip_configuration {
    name                          = "${var.vm_prefix}-${count.index +1}-nic-01"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "dynamic"
  }

}

resource "azurerm_virtual_machine" "main" {
  count                 = "${var.rdsh_count}"
  name                  = "${var.vm_prefix}-${count.index + 1}"
  location              = "${var.region}"
  resource_group_name   = "${var.resource_group_name}"
  network_interface_ids = ["${azurerm_network_interface.rdsh.*.id[count.index]}"]
  vm_size               = "${var.vm_size}"
  availability_set_id   = "${azurerm_availability_set.main.id}"

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    
    id        = "${var.vm_image_id != "" ? var.vm_image_id : ""}"
    publisher = "${var.vm_image_id == "" ? var.vm_publisher : ""}"
    offer     = "${var.vm_image_id == "" ? var.vm_offer : ""}"
    sku       = "${var.vm_image_id == "" ? var.vm_sku : ""}"
    version   = "${var.vm_image_id == "" ? var.vm_version : ""}"
  }

  storage_os_disk {
    name              = "${lower(var.vm_prefix)}-${count.index +1}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    disk_size_gb      = "128"
  }

  os_profile {
    computer_name  = "${var.vm_prefix}-${count.index +1}"
    admin_username = "${var.local_admin_username}"
    admin_password = "${random_string.wvd-local-password.*.result[count.index]}"
  }

  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = true
    timezone                  = "${var.vm_timezone}"
  }
}

resource "azurerm_availability_set" "main" {
  name                         = "${var.host_pool_name}"
  location                     = "${var.region}"
  resource_group_name          = "${var.resource_group_name}"
  managed                      = "true"
  platform_update_domain_count = "${var.as_platform_update_domain_count}"
  platform_fault_domain_count  = "${var.as_platform_fault_domain_count}"
}