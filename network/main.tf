resource "azurerm_virtual_network" "moddev_vnet" {
  name                = "moddev-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.RESOURCE_GROUP_LOCATION
  resource_group_name = var.RESOURCE_GROUP_NAME
}

resource "azurerm_subnet" "moddev_subnet" {
  name                 = "internal"
  resource_group_name  = var.RESOURCE_GROUP_NAME
  virtual_network_name = azurerm_virtual_network.moddev_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}
