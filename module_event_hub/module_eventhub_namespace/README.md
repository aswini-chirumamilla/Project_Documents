<!-- BEGIN_TF_DOCS -->

###### Last Updated[DD/MM/YYYY]: 28/11/2022

## Introduction

Manages the eventhub namespace.

## Providers

| Name                                                         | Version |
| ------------------------------------------------------------ | ------- |
| <a name="provider_azurerm"></a> [azurerm](#provider_azurerm) | n/a     |

## File Structure

This particular module is having the following configuration files.

- main.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in main.tf.
- outputs.tf : This file will be having the resource output details generated.

## Resources

| Name                                                                                                                                                                                                      | Type     |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [azurerm_eventhub_namespace.event_hub_namespace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace)                                                      | resource |
| [azurerm_eventhub_namespace_customer_managed_key.event_hub_customer_managed_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace_customer_managed_key) | resource |
| [azurerm_key_vault_access_policy.namespace_cmk_base_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy)                                      | resource |

## Inputs

| Name                                                                                                                     | Description                                                                                                                                                                                                           | Type                                                                                                                                                                                                                                                                                                                                                            | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | Required |
| ------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------: |
| <a name="input_auto_inflate_enabled"></a> [auto_inflate_enabled](#input_auto_inflate_enabled)                            | Is Auto Inflate enabled for the EventHub Namespace?                                                                                                                                                                   | `bool`                                                                                                                                                                                                                                                                                                                                                          | `false`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |    no    |
| <a name="input_dedicated_cluster_id"></a> [dedicated_cluster_id](#input_dedicated_cluster_id)                            | Specifies the ID of the EventHub Dedicated Cluster where this Namespace should created. Changing this forces a new resource to be created.                                                                            | `string`                                                                                                                                                                                                                                                                                                                                                        | `null`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |    no    |
| <a name="input_event_hub_capacity"></a> [event_hub_capacity](#input_event_hub_capacity)                                  | Specifies the Capacity / Throughput Units for a Standard SKU namespace. Default capacity has a maximum of 2, but can be increased in blocks of 2 on a committed purchase basis.                                       | `number`                                                                                                                                                                                                                                                                                                                                                        | `2`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |    no    |
| <a name="input_event_hub_namespace_name"></a> [event_hub_namespace_name](#input_event_hub_namespace_name)                | Specifies the name of the EventHub Namespace resource. Changing this forces a new resource to be created.                                                                                                             | `string`                                                                                                                                                                                                                                                                                                                                                        | n/a                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |   yes    |
| <a name="input_event_hub_sku"></a> [event_hub_sku](#input_event_hub_sku)                                                 | Defines which tier to use. Valid options are Basic, Standard, and Premium. Please note that setting this field to Premium will force the creation of a new resource and also requires setting zone_redundant to true. | `string`                                                                                                                                                                                                                                                                                                                                                        | n/a                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |   yes    |
| <a name="input_identity"></a> [identity](#input_identity)                                                                | An identity block as defined below.                                                                                                                                                                                   | <pre>list(object({<br> type = string<br> }))</pre>                                                                                                                                                                                                                                                                                                              | <pre>[<br> {<br> "type": "SystemAssigned"<br> }<br>]</pre>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |    no    |
| <a name="input_key_vault_key_ids"></a> [key_vault_key_ids](#input_key_vault_key_ids)                                     | The list of keys of Key Vault.                                                                                                                                                                                        | `list(any)`                                                                                                                                                                                                                                                                                                                                                     | n/a                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |   yes    |
| <a name="input_keyvault_id"></a> [keyvault_id](#input_keyvault_id)                                                       | Keyvault ID                                                                                                                                                                                                           | `string`                                                                                                                                                                                                                                                                                                                                                        | `null`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |    no    |
| <a name="input_local_authentication_enabled"></a> [local_authentication_enabled](#input_local_authentication_enabled)    | Is SAS authentication enabled for the EventHub Namespace?                                                                                                                                                             | `bool`                                                                                                                                                                                                                                                                                                                                                          | `false`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |    no    |
| <a name="input_location"></a> [location](#input_location)                                                                | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created                                                                                                   | `string`                                                                                                                                                                                                                                                                                                                                                        | n/a                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |   yes    |
| <a name="input_maximum_thoroughput_units"></a> [maximum_thoroughput_units](#input_maximum_thoroughput_units)             | Specifies the maximum number of throughput units when Auto Inflate is Enabled. Valid values range from 1 - 20.                                                                                                        | `number`                                                                                                                                                                                                                                                                                                                                                        | `0`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |    no    |
| <a name="input_minimum_tls_version"></a> [minimum_tls_version](#input_minimum_tls_version)                               | The minimum supported TLS version for this EventHub Namespace. Valid values are: 1.0, 1.1 and 1.2. The current default minimum TLS version is 1.2.                                                                    | `string`                                                                                                                                                                                                                                                                                                                                                        | `"1.2"`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |    no    |
| <a name="input_network_rulesets"></a> [network_rulesets](#input_network_rulesets)                                        | A network_rulesets block as defined below.                                                                                                                                                                            | <pre>list(object({<br> default_action = string,<br> public_network_access = bool,<br> trusted_service_access_enabled = string,<br> virtual_network_rule = list(object({<br> subnet_id = string,<br> ignore_missing_virtual_network_service_endpoint = bool<br> })),<br> ip_rule = list(object({<br> ip_mask = string,<br> action = string<br> }))<br> }))</pre> | <pre>[<br> {<br> "default_action": "Deny",<br> "ip_rule": [<br> {<br> "action": "Allow",<br> "ip_mask": "20.235.192.128"<br> }<br> ],<br> "public_network_access": true,<br> "trusted_service_access_enabled": true,<br> "virtual_network_rule": [<br> {<br> "ignore_missing_virtual_network_service_endpoint": false,<br> "subnet_id": "/subscriptions/eeab8781-7893-428d-a24d-477cd05fc384/resourceGroups/azure-cil-manual-resource-group/providers/Microsoft.Network/virtualNetworks/vneteventhub/subnets/testsubnet"<br> }<br> ]<br> }<br>]</pre> |    no    |
| <a name="input_public_network_access_enabled"></a> [public_network_access_enabled](#input_public_network_access_enabled) | Is public network access enabled for the EventHub Namespace? Defaults to true.                                                                                                                                        | `bool`                                                                                                                                                                                                                                                                                                                                                          | `true`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |    no    |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name)                               | The name of the resource group in which to create the namespace. Changing this forces a new resource to be created.                                                                                                   | `string`                                                                                                                                                                                                                                                                                                                                                        | n/a                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                            | A mapping of tags to assign to the resource.                                                                                                                                                                          | `map(string)`                                                                                                                                                                                                                                                                                                                                                   | <pre>{<br> "Application_name": "event hub",<br> "Contact_name": "xyz",<br> "Cost_Center": 999<br>}</pre>                                                                                                                                                                                                                                                                                                                                                                                                                                              |    no    |
| <a name="input_use_customer_managed_key"></a> [use_customer_managed_key](#input_use_customer_managed_key)                | Specifies whether a customer managed key needs to be utilized or not                                                                                                                                                  | `bool`                                                                                                                                                                                                                                                                                                                                                          | `false`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |    no    |
| <a name="input_zone_redundant"></a> [zone_redundant](#input_zone_redundant)                                              | Specifies if the EventHub Namespace should be Zone Redundant (created across Availability Zones). Changing this forces a new resource to be created. Defaults to false.                                               | `bool`                                                                                                                                                                                                                                                                                                                                                          | `false`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |    no    |

## Outputs

| Name                                                                                               | Description                         |
| -------------------------------------------------------------------------------------------------- | ----------------------------------- |
| <a name="output_eventhub_namespace_id"></a> [eventhub_namespace_id](#output_eventhub_namespace_id) | Specifies the eventhub namespace id |

## Module Usage

module "eventhub_namespace" {
source = "../../modules/event_hub-creation/module_eventhub_namespace"

# Eventhub namespace resource

event_hub_namespace_name = var.event_hub_namespace_name
resource_group_name = var.resource_group_name
location = var.location
event_hub_sku = var.event_hub_sku
event_hub_capacity = var.event_hub_capacity
auto_inflate_enabled = var.auto_inflate_enabled
dedicated_cluster_id = var.dedicated_cluster_id
identity = var.identity
maximum_thoroughput_units = var.maximum_thoroughput_units
zone_redundant = var.zone_redundant
tags = var.tags
network_rulesets = var.network_rulesets
local_authentication_enabled = var.local_authentication_enabled
public_network_access_enabled = var.public_network_access_enabled
minimum_tls_version = var.minimum_tls_version
use_customer_managed_key = var.use_customer_managed_key
key_vault_key_ids = var.provide_keyvault_key_id == true && var.use_customer_managed_key ? [var.key_vault_key_id_user] : [azurerm_key_vault_key.key_vault_key[0].id]
keyvault_id = var.keyvault_id
}

<!-- END_TF_DOCS -->