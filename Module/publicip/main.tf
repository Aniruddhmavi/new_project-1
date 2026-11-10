resource "azurerm_public_ip" "pubip" {
    for_each = var.publicip
  name                    = each.value.publicip
  location                = each.value.location
  resource_group_name     = each.value.rg_name
  allocation_method       = each.value.allocation_method


  tags = {
    environment = "test"
  }
}