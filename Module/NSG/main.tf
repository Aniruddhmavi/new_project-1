resource "azurerm_network_security_group" "NSG" {
    for_each = var.nsg
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  security_rule {
    name                       = each.value.security_rule
    priority                   = each.value.priority
    direction                  = each.value.direction
    access                     = each.value.access
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

resource "azurerm_subnet_network_security_group_association" "nsga" {
    for_each = var.nsg
  subnet_id                 = data.azurerm_subnet.data_subnet[each.key].id
  network_security_group_id = azurerm_network_security_group.NSG[each.key].id
}