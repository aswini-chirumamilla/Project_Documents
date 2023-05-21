resource_group                = "cilrg"
cdn_profile                   = "cdn123"
cdn_endpoint                  = "endp34"
sku                           = "Standard_Microsoft"
origin                        = "origin1"
host_name                     = "www.contoso.com"
relative_path                 = "/"
action                        = "Allow"
country_codes                 = ["US"]
optimization_type             = "GeneralWebDelivery"
behavior                      = "Override"
duration                      = "01:00:00"
delivery_rule                 = "delivery123"
order                         = "1"
operator                      = "Equal"
match_values                  = ["css", "js", "woff", "woff2"]
transforms                    = ["Lowercase"]
querystring_caching_behaviour = "IgnoreQueryString"
is_compression_enabled        = "true"
content_types_to_compress     = ["text/plain", "application/json", "application/x-javascript", "application/javascript", "application/xml", "text/javascript", "text/html", "text/css"]
resource_group_name           = "rg"
location                      = "westus"
create_resource_group         = true
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "111"
  Application_name = "CDN"
}
storage_account_name             = "cdnaccountzzzz"
storage_account_tier             = "Standard"
storage_account_replication_type = "LRS"
