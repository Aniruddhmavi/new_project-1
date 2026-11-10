data "azurerm_subnet" "data_subnet" {
    for_each = var.nsg
  name                 = each.value.subnet
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_network_security_group" "data_nsg" {
    for_each = var.nsg
  name                = each.value.nsg_name
  resource_group_name = each.value.rg_name
}