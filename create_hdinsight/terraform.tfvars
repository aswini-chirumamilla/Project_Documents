rg_name                  = "my_terraform_rg"
cluster_version          = "3.6"
tier                     = "Standard"
component_version        = "2.7"
username                 = "acctestusrgw"
password                 = "TerrAform123!"
is_default               = true
hnode_vm_size            = "Standard_D3_V2"
hnode_username           = "acctestusrvm"
hnode_password           = "AccTestvdSC4daf986!"
wnode_vm_size            = "Standard_D4_V2"
wnode_username           = "acctestusrvm"
wnode_password           = "AccTestvdSC4daf986!"
target_instance_count    = 3
znode_vm_size            = "Standard_D3_V2"
znode_username           = "acctestusrvm"
znode_password           = "AccTestvdSC4daf986!"
account_tier             = "Standard"
account_replication_type = "LRS"
storage_account_name     = "hdinsightstor576869699"
container_name           = "hdinsightcontainer"
container_access_type    = "private"
hadoop_cluster_name      = "example-hdicluster101"