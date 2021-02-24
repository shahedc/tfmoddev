terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.48"
    }
  }
}

provider "azurerm" {
  subscription_id = var.SUBSCRIPTION_ID
  features {}
}