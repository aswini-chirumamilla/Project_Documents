#----MONGODB DATABASE----#
mongo_db_name           = "testing-mdb-as"
resource_group_name     = "testing-cosmos-rg-as"
cosmosdb_account_name   = "testing-cosmosdb-acc-001"
mongodb_throughput      = 400
db_max_throughput       = null

#----MONGODB COLLECTION----#
mongodb_collection_name = "testing-mdbc-as"
shard_key               = "someother_key"
analytical_storage_ttl  = 0
default_ttl_seconds     = 777
throughput              = 400
index = [ {
  keys = [ "_id" ]
  unique = false
} ]
mdc_max_throughput      = null

#----COSMOSDB ACCOUNT----#
location                              = "East US"
cosmosdb_offer_type                   = "Standard"
cosmosdb_kind                         = "MongoDB"
cosmosdb_create_mode                  = null //"Default"
default_identity_type                 = "FirstPartyIdentity"
enable_automatic_failover             = true
ip_range_filter                       = "49.204.228.223/29,0.0.0.0" #The Azure feature "Allow access to Azure services" can be enabled by setting ip_address to 0.0.0.0             
enable_free_tier                      = false
analytical_storage_enabled            = true
enable_multiple_write_locations       = true
access_key_metadata_writes_enabled    = true
public_network_access_enabled         = true
is_virtual_network_filter_enabled     = true
key_vault_key_id                      = null
network_acl_bypass_for_azure_services = true
network_acl_bypass_ids                = null
mongo_server_version                  = "3.6"
local_authentication_disabled         = false
consistency_level                     = "BoundedStaleness"
max_interval_in_seconds               = 300
max_staleness_prefix                  = 100000
failover_location                     = "west us"
failover_priority                     = "0"
zone_redundant                        = false
capabilities_name                     = "EnableMongo"
subnet_id                             = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/testing-cosmos-rg-as/providers/Microsoft.Network/virtualNetworks/testing-cosmos-vnet-as/subnets/default"
ignore_missing_vnet_service_endpoint  = true
schema_type                           = "WellDefined"
total_throughput_limit                = "-1"
backup_type                           = "Periodic"
backup_interval_in_minutes            = 60
backup_retention_in_hours             = 8
backup_storage_redundancy             = "Local"
cors_rule                             = null
identity_type                         = "SystemAssigned"
identity_ids                          = null
source_cosmosdb_account_id            = null
restore_timestamp_in_utc              = null
database_name                         = null
database_collection_names             = null
tags = {
  contact_email = "aabya.singh@gds.ey.com"
  contact_name  = "Aabya"
  project_name  = "Azure_CIL"
  region        = "East US"
}                                 