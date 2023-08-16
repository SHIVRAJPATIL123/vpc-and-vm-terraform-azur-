rg_name_outside = "1-d31253e9-playground-sandbox"

rg_location_outside = "australiacentral"

subnet_name = "mysubnet"

virtual_machine_name_out = "mfvm"
virtual_machine_size     = "Standard_d2"
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




