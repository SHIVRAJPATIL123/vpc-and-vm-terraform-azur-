rg_name_outside = "shivraj"

rg_location_outside = "East US"

subnet_name = "mysubnet"

virtual_machine_name_out = "mfvm"
virtual_machine_size     = "Standard_B1ls"
username                 = "shivraj"
delegation               = ""
add_space_outside        = ["10.0.0.0/16"]
subnet_prefix            = [
    {
      ip   = "10.0.1.0/24"
      name = "subnet1"
    }#,
#     {
#       ip   = "10.0.2.0/24"
#       name = "subnet2"
#     },
#     {
#         ip = "10.0.3.0/24"
#         name = "subnet3"
#     }
  ]




