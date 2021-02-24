resource "azurerm_resource_group" "moddev_rg" {
  name     = "ModDevWinRG"
  location = "eastus"
}

resource "azurerm_virtual_network" "moddev_vnet" {
  name                = "moddev-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.moddev_rg.location
  resource_group_name = azurerm_resource_group.moddev_rg.name
}

resource "azurerm_subnet" "moddev_subnet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.moddev_rg.name
  virtual_network_name = azurerm_virtual_network.moddev_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "moddev_nic" {
  name                = "moddev-nic"
  location            = azurerm_resource_group.moddev_rg.location
  resource_group_name = azurerm_resource_group.moddev_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.moddev_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "winvm_01" {
  name                = "winvm-01"
  resource_group_name = azurerm_resource_group.moddev_rg.name
  location            = azurerm_resource_group.moddev_rg.location
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


