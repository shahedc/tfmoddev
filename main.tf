resource "azurerm_resource_group" "moddev_rg" {
  name     = var.RESOURCE_GROUP_NAME
  location = var.RESOURCE_GROUP_LOCATION
}

module "network" {
  source                  = "./network"
  RESOURCE_GROUP_NAME     = azurerm_resource_group.moddev_rg.name
  RESOURCE_GROUP_LOCATION = azurerm_resource_group.moddev_rg.location
}

module "vm" {
  source                  = "./vm"
  RESOURCE_GROUP_NAME     = azurerm_resource_group.moddev_rg.name
  RESOURCE_GROUP_LOCATION = azurerm_resource_group.moddev_rg.location
  SUBNET_ID               = module.network.moddev_subnet_id
  VM01_ADMIN_USR          = var.VM01_ADMIN_USR
  VM01_ADMIN_PWD          = var.VM01_ADMIN_PWD
}
