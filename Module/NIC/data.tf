data "azurerm_public_ip" "data_pub" {
    for_each = var.nic_name
  name                = each.value.publicip
  resource_group_name = each.value.rg_name
}

data "azurerm_subnet" "data_subnet" {
    for_each = var.nic_name
  name                 = each.value.subnet
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}
