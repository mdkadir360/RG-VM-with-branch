module "Rg" {
  source = "github.com/mdkadir360/Terraform_Module_for_Branch//1.RG"
  rgs    = var.rg
}

module "Storage" {
  source     = "github.com/mdkadir360/Terraform_Module_for_Branch//2.STORAGE"
  storage    = var.storage
  depends_on = [module.Rg]

}

module "con" {
  source     = "github.com/mdkadir360/Terraform_Module_for_Branch//3.CONTAINER"
  con        = var.con
  depends_on = [module.Storage]

}

module "vnet" {
  source     = "github.com/mdkadir360/Terraform_Module_for_Branch//4.VNET"
  vnet       = var.vnet
  depends_on = [module.Rg]
}
module "subnet" {
  source     = "github.com/mdkadir360/Terraform_Module_for_Branch//5.SUBNET"
  subnet     = var.subnet
  depends_on = [module.vnet]
}
module "pip" {
  source     = "github.com/mdkadir360/Terraform_Module_for_Branch//6.PUBLIC_IP"
  pip        = var.pip
  depends_on = [module.Rg]
}
module "nic" {
  source     = "github.com/mdkadir360/Terraform_Module_for_Branch//7.NIC"
  nic        = var.nic
  depends_on = [module.Rg, module.subnet, module.vnet, module.pip]
}
module "nsg" {
  source     = "github.com/mdkadir360/Terraform_Module_for_Branch//8.NSG"
  nsg        = var.nsg
  security   = var.security
  depends_on = [module.Rg]
}

module "nsgass" {
  source      = "github.com/mdkadir360/Terraform-env-gitops/tree/main/9.NSG_ASSOCIATION"
  association = var.associationm
  depends_on  = [module.nsg, module.subnet]
}
module "vm" {
  source     = "github.com/mdkadir360/Terraform_Module_for_Branch//10.VM"
  vm         = var.vm
  depends_on = [module.Rg, module.nic, module.pip, module.subnet, module.nsgass]
}