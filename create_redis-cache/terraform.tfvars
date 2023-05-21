
create_resource_group           = false
resource_group_name             = "rg01"
location                        = "east us"

redis_cache_name                = "c23a3he"
redis_cache_capacity            = "2"
redis_cache_family              = "P"
redis_cache_sku_name            = "Premium"
redis_cache_enable_non_ssl_port = true
redis_cache_minimum_tls_version   = "1.2"
patch_schedule_day_of_week        = "Friday"
patch_schedule_maintenance_window = "PT6H"
patch_schedule_start_hour_utc     = null
private_static_ip_address         = null
public_network_access_enabled     = true
managed_identity_type             = "SystemAssigned"
managed_identity_ids              = null
aof_backup_enabled              = false
aof_storage_connection_string_0 = null
aof_storage_connection_string_1 = null
enable_authentication           = true
maxmemory_reserved              = "2"
maxmemory_delta                 = "2"
maxmemory_policy                = "volatile-lru"
maxfragmentationmemory_reserved = "2"
rdb_backup_enabled              = true
rdb_backup_frequency            = null
rdb_backup_max_snapshot_count   = null
rdb_storage_connection_string   = null
notify_keyspace_events          = null
replicas_per_master  = null
replicas_per_primary = null
redis_version        = "4"
tenant_settings      = null
shard_count          = null
subnet_ids           = null
zones                = null
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "Redis_Cache"
}


storage_account_id       = "/subscriptions/2a24fef9-dc44-4a62-a3a6-001ade556497/resourceGroups/rg01/providers/Microsoft.Storage/storageAccounts/vbhgh"
action_group_name        = "example-action-group6"
short_name               = "actiong6"
action_group_rule_name   = "example-6"
scope_type               = "Resource"
activity_log_alert_name  = "example-activitylogalert6"
operation_name_log_alert = "Microsoft.Network/networkSecurityGroups/write"
category_log_alert       = "Security"
metric_alert_name        = "example-metricalert6"
metric_namespace         = "Microsoft.Storage/storageAccounts"
metric_name              = "Transactions"
aggregation              = "Total"
operator                 = "GreaterThan"
threshold                = 50
dimension_name           = "ApiName"
dimension_operator       = "Include"
values                   = ["*"]

enable_log_monitoring           = true
diag_name                       = "kv-diag6"
log_analytics_workspace_id      = null
log_analytics_destination_type  = null #"Dedicated"
eventhub_name                   = null
eventhub_authorization_rule_id  = null
log_enabled                     = true
log_retention_policy_enabled    = true
log_retention_days              = 7
metric_retention_policy_enabled = true
metric_retention_days           = 7

private_connection_resource_alias = null
private_endpoint_name             = "endpoint12"
private_service_connection_name   = "privateserviceconnection-rediscache"
subresource_names                 = ["redisCache"]
is_manual_connection              = false
request_message                   = "PL"
subnet_id                         = "/subscriptions/2a24fef9-dc44-4a62-a3a6-001ade556497/resourceGroups/rg01/providers/Microsoft.Network/virtualNetworks/vnet/subnets/default"
private_dns_zone_group = null