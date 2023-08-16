
module "rg" {
  source      = "./module/rg"
  rg_name     = var.rg_name_outside
  rg_location = var.rg_location_outside
}

module "vnet" {
  source                 = "./module/vnet"
  vnet_name              = "${module.rg.rg_name}-vnet"
  vnet_location          = module.rg.rg_location
  rg_name                = module.rg.rg_name
  create_subnet          = true
  subnet_name            = var.subnet_name
  network_interface_name = "${var.subnet_name}-nic"
  delegation             = var.delegation
  add_space              = var.add_space_outside
  subnet_prefix          = var.subnet_prefix
}



module "vm" {
  source                = "./module/vm"
  rg_name               = module.rg.rg_name
  rg_location           = module.rg.rg_location
  virtual_machine_name  = var.virtual_machine_name_out
  network_interface_ids = [module.vnet.network_interface_id]
  virtual_machine_size  = var.virtual_machine_size
  username              = var.username

}



  