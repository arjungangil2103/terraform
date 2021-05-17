# Please use terraform v12.29 to start with for all labs, I will use terraform v13 and v14 from lab 7.5 onwards
provider "azurerm" {
  version = "= 2.18"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "Terra21-rg"
  location = "West Europe"
}


resource "azurerm_key_vault" "rg" {
  name                = "kvult-89"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = "f48dd8ff-b227-4d9f-91ce-fa1a4028252d"
  sku_name            = "standard"
}


resource "azurerm_storage_account" "rg" {
  name                     = "remotesa89"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}