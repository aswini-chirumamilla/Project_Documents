#BACKUP_VM : MODULE

#-----------------------------------------DATA SOURCE: RESOURCE GROUP-------------------------------------#
data "azurerm_resource_group" "rg" {
  name = var.resource_group
}

#----------------------------------------------------------------------------------------------------------#
#                                         BACKUP VM                                                        #
#----------------------------------------------------------------------------------------------------------#

#-----------------------------------------RESOURCE: RECOVERY SERVICE VAULT---------------------------------#
resource "azurerm_recovery_services_vault" "vault" {
  name                = var.recovery_service_vault_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku                 = var.recovery_service_vault_sku
  soft_delete_enabled = var.recovery_soft_delete_enabled
  #storage_mode_type   = var.storage_mode_type
  identity {
    type = var.identity_type
  }
  tags = var.tags
}
#-----------------------------------------RESOURCE: VM BACKUP POLICY---------------------------------------#
resource "azurerm_backup_policy_vm" "example" {
  name                = var.backup_policy_vm_name
  resource_group_name = data.azurerm_resource_group.rg.name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name

  backup {
    frequency = var.backup_frequency
    time      = var.backup_time
  }

  retention_daily {
    count = var.retention_daily_count
  }

}

resource "azurerm_backup_protected_vm" "vm1" {
  resource_group_name = data.azurerm_resource_group.rg.name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name
  source_vm_id        = azurerm_virtual_machine.vm1.id
  backup_policy_id    = azurerm_backup_policy_vm.example.id


}

#-----------------------------------------RESOURCE: VIRTUAL MACHINE----------------------------------------#
resource "azurerm_virtual_machine" "vm1" {
  name                  = var.virtual_machine
  location              = data.azurerm_resource_group.rg.location
  resource_group_name   = data.azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = var.vm_size
  delete_os_disk_on_termination = var.delete_os_disk_on_termination
  delete_data_disks_on_termination = var.delete_data_disks_on_termination
  license_type = var.license_type
  availability_set_id = azurerm_availability_set.example.id
  

  storage_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.latest_version
  }

  storage_os_disk {
    name              = var.storage_os_disk
    caching           = var.caching
    create_option     = var.create_option
    managed_disk_type = var.managed_disk_type
  }

  storage_data_disk {
    name = var.storage_data_disk
    caching = var.storage_data_disk_caching
    create_option = var.storage_data_disk_create_option
    lun = var.lun
    disk_size_gb    =var.disk_size_gb
    
  }

  os_profile {
    computer_name  = var.os_profile
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_windows_config {
    provision_vm_agent = var.provision_vm_agent
  }

  boot_diagnostics {
    enabled = var.boot_diagnostics_enabled
    storage_uri = azurerm_storage_account.example.primary_blob_endpoint
    
  }

  identity {
    type = var.identity_type
  }
  
  tags = var.tags
}

#----------------------------------------------------------------------------------------------------------#
#                                      VIRTUAL MACHINES RESOURCES                                          #
#----------------------------------------------------------------------------------------------------------#

#-----------------------------------------RESOURCE: VNET & SUBNET------------------------------------------#
resource "azurerm_virtual_network" "main" {
  name                = var.virtual_network
  address_space       = var.address_space
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "internal" {
  name                 = var.subnet
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.address_prefixes
  enforce_private_link_service_network_policies  = var.enforce_private_link_service_network_policies
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
}

#-----------------------------------------RESOURCE: NETWORK INTERFACE--------------------------------------#
resource "azurerm_network_interface" "main" {
  name                = var.network_interface
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.interface_ip
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
}

#-----------------------------------------RESOURCE: STORAGE ACCOUNT----------------------------------------#
resource "azurerm_storage_account" "example" {
  name                     = var.storage_account
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "azurerm_storage_container" "example" {
  name                  = "content" #var.storage_container
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private" #var.container_access_type
}

resource "azurerm_storage_blob" "example" {
  name                   = "my-awesome-content.zip" #var.storage_blob
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = "Block" #var.type
}

#-----------------------------------------RESOURCE: AVAILABILITY SET----------------------------------------#
resource "azurerm_availability_set" "example" {
  name                = var.availability_set
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  platform_update_domain_count = var.platform_update_domain_count
  platform_fault_domain_count = var.platform_fault_domain_count
  
}

#----------------------------------------RESOURCES: FOR NETWORKING-----------------------------------------#
resource "azurerm_public_ip" "pip" {
  name                = var.public_ip
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  allocation_method   = var.public_ip_allocation
}

resource "azurerm_network_security_group" "webserver" {
  name                = var.nsg_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  security_rule {
    access                     = var.security_rule_access
    direction                  = var.security_rule_direction
    name                       = var.security_rule_name
    priority                   = var.security_rule_priority
    protocol                   = var.security_rule_protocol
    source_port_range          = var.security_rule_source_port_range
    source_address_prefix      = var.security_rule_source_address_prefix
    destination_port_range     = var.security_rule_destination_port_range
    destination_address_prefix = azurerm_subnet.internal.address_prefix
  }
}

resource "azurerm_lb" "example" {
  name                = var.lb_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  frontend_ip_configuration {
    name                 = var.lb_frontend_ip_config
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}

resource "azurerm_lb_backend_address_pool" "example" {
  #resource_group_name = data.azurerm_resource_group.rg.name
  loadbalancer_id     = azurerm_lb.example.id
  name                = var.lb_backend_address_pool
}

resource "azurerm_lb_nat_rule" "example" {
  resource_group_name            = data.azurerm_resource_group.rg.name
  loadbalancer_id                = azurerm_lb.example.id
  name                           = var.lb_nat_rule
  protocol                       = var.lb_nat_rule_protocol
  frontend_port                  = var.lb_nat_rule_frontend_port
  backend_port                   = var.lb_nat_rule_backend_port
  frontend_ip_configuration_name = azurerm_lb.example.frontend_ip_configuration[0].name
}

resource "azurerm_network_interface_backend_address_pool_association" "example" {
  backend_address_pool_id = azurerm_lb_backend_address_pool.example.id
  ip_configuration_name   = var.interface_address_association
  network_interface_id    = azurerm_network_interface.main.id
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.main.id
  network_security_group_id = azurerm_network_security_group.webserver.id
}

resource "azurerm_application_security_group" "example" {
  name                = var.application_security_group
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}


#-----------------------------------------RESOURCE: VM SHUTDOWN SCHEDULE------------------------------------#
resource "azurerm_dev_test_global_vm_shutdown_schedule" "rg" {
  virtual_machine_id = azurerm_virtual_machine.vm1.id
  location           = data.azurerm_resource_group.rg.location
  enabled            = var.vm_shutdown_schedule_enabled

  daily_recurrence_time = var.daily_recurrence_time
  timezone              = var.timezone


  notification_settings {
    enabled         = var.notification_settings_enabled
   
  }
 }

#-----------------------------------------RESOURCE: LOG ANALYTICS WORKSPACE--------------------------------#
resource "azurerm_log_analytics_workspace" "example" {
  name                = var.log_analytics_workspace
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku                 = var.log_sku
  retention_in_days   = var.retention_in_days
}

#-----------------------------------------RESOURCE: VM EXTENSION------------------------------------------#
#Create a Virtual Machine Extension (a monitoring agent)
#Collects events and performance data from the virtual machine and delivers it to the Log Analytics workspace.
resource "azurerm_virtual_machine_extension" "mmaagent" {
  name                       = var.vm_monitoring_agent_name
  virtual_machine_id         = azurerm_virtual_machine.vm1.id
  publisher                  = var.monitoring_publisher
  type                       = var.monitoring_type
  type_handler_version       = var.monitoring_type_handler_version
  auto_upgrade_minor_version = var.monitoring_auto_upgrade_minor_version
  settings                   = <<SETTINGS
    {
      "workspaceId": "${azurerm_log_analytics_workspace.example.workspace_id}"
    }
SETTINGS
  protected_settings         = <<PROTECTED_SETTINGS
   {
      "workspaceKey": "${azurerm_log_analytics_workspace.example.primary_shared_key}"
   }
PROTECTED_SETTINGS
}

#-----------------------------------------RESOURCE: LOG ANALYTICS SOLUTION---------------------------------#
resource "azurerm_log_analytics_solution" "example" {
  solution_name         = var.solution_name
  location              = data.azurerm_resource_group.rg.location
  resource_group_name   = data.azurerm_resource_group.rg.name
  workspace_resource_id = azurerm_log_analytics_workspace.example.id
  workspace_name        = azurerm_log_analytics_workspace.example.name

  plan {
    publisher = var.plan_publisher
    product   = var.plan_product
  }
}

#-----------------------------------------RESOURCE: VM EXTENSION------------------------------------------#
#Create a VM Extension (a dependency agent for windows)
#Collects discovered data about processes running on the virtual machine and external process dependencies, which are used by the Map feature in VM insights. The Dependency agent relies on the Log Analytics agent to deliver its data to Azure Monitor.
resource "azurerm_virtual_machine_extension" "da" {
  name = var.vm_dependency_agent_name
  depends_on = [
    azurerm_log_analytics_solution.example
  ]
  virtual_machine_id         = azurerm_virtual_machine.vm1.id
  publisher                  = var.dependency_agent_publisher
  type                       = var.dependency_agent_type
  type_handler_version       = var.dependency_agent_type_handler
  auto_upgrade_minor_version = var.dependency_agent_auto_upgrade
}

#-----------------------------------------RESOURCE: VM EXTENSION------------------------------------------#
#Create a VM Extension (FOR DIAG SETTINGS)
resource "azurerm_virtual_machine_extension" "InGuestDiagnostics" {
  name                       = var.diag_name
  virtual_machine_id        = azurerm_virtual_machine.vm1.id
  publisher                  = var.diag_publisher
  type                       = var.diag_type
  type_handler_version       = var.diag_type_handler_version
  auto_upgrade_minor_version = var.diag_auto_upgrade_minor_version

  settings           = <<SETTINGS
    {
      "xmlCfg": "${base64encode(templatefile("${path.module}/templates/wadcfgxml.tmpl", { vmid = azurerm_virtual_machine.vm1.id }))}",
      "storageAccount": "${azurerm_storage_account.example.name}"
    }
SETTINGS
  protected_settings = <<PROTECTEDSETTINGS
    {
      "storageAccountName": "${azurerm_storage_account.example.name}",
      "storageAccountKey": "${azurerm_storage_account.example.primary_access_key}",
      "storageAccountEndPoint": "https://core.windows.net"
    }
PROTECTEDSETTINGS
}

#-----------------------------------------RESOURCE: SECURITY CENTER RESOURCES------------------------------#
/*resource "azurerm_security_center_workspace" "main" {
  scope        = azurerm_virtual_machine.vm1.id
  workspace_id = azurerm_log_analytics_workspace.example.id
}

resource "azurerm_security_center_subscription_pricing" "main" {
  tier          = var.security_center_subscription_pricing_tier
  resource_type = var.security_resource_type
}

resource "azurerm_security_center_contact" "main" {
  email               = var.security_center_email
  phone               = var.security_center_phone
  alert_notifications = var.security_center_alert_notifications
  alerts_to_admins    = var.security_center_alerts_to_admins
}

resource "azurerm_security_center_setting" "main" {
  setting_name = var.security_center_setting_name
  enabled      = var.enable_security_center_setting
}

resource "azurerm_security_center_auto_provisioning" "main" {
  auto_provision = var.enable_security_center_auto_provisioning
}
*/

#---------------------------------------------------------------------------------------------------------#