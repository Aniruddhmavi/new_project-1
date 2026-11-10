module "resource_group" {
  source  = "../../Module/resource_group"
  rg_name = var.rgs

}

module "vnet" {
  source     = "../../Module/vnet"
  vnet       = var.vnets
  depends_on = [module.resource_group]

}

module "subnet" {
  source     = "../../Module/subnet"
  subnet     = var.subnets
  depends_on = [module.vnet]

}

module "pubip" {
  source     = "../../Module/publicip"
  publicip   = var.pips
  depends_on = [module.subnet]

}

module "nic" {
  source     = "../../Module/NIC"
  nic_name   = var.nics
  depends_on = [module.pubip]

}

module "nsg" {
  source     = "../../Module/NSG"
  nsg        = var.nsgs
  depends_on = [module.nic]

}

module "linux_vm" {
  source     = "../../Module/virtual_machin"
  linux_vm   = var.vms
  depends_on = [module.nsg]

}

module "aks" {
  source     = "../../Module/AKS"
  aks1       = var.akss
  depends_on = [module.linux_vm]

}

module "acr" {
  source     = "../../Module/acr"
  acr_name   = var.acr1
  depends_on = [module.aks]

}




