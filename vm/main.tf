
resource "azurerm_windows_virtual_machine" "winvm_01" {
  name                = "winvm-01"
  resource_group_name = var.RESOURCE_GROUP_NAME
  location            = var.RESOURCE_GROUP_LOCATION
  size                = "Standard_F2"
  admin_username      = var.VM01_ADMIN_USR
  admin_password      = var.VM01_ADMIN_PWD
  network_interface_ids = [
    azurerm_network_interface.moddev_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_network_interface" "moddev_nic" {
  name                = "moddev-nic"
  location            = var.RESOURCE_GROUP_LOCATION
  resource_group_name = var.RESOURCE_GROUP_NAME

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.SUBNET_ID
    private_ip_address_allocation = "Dynamic"
  }
}
