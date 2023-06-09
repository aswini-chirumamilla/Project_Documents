resource_group_name           = "rg"
create_resource_group         = false
location                      = "east us"
network_security_group        = "nsgPoC1"
application_security_group    = "tf-appsecuritygroup"
sr_name                       = "SSH"
sr_priority                   = 1001
sr_direction                  = "Inbound"
sr_access                     = "Allow"
sr_protocol                   = "Tcp"
sr_source_port_range          = "*"
sr_destination_port_range     = "22"
sr_destination_address_prefix = "*"
tags = {
  Contact_name     = "Nikita"
  Cost_Center      = 999
  Application_name = "application security grp"
}
role_definition_name = [ "Reader" ]