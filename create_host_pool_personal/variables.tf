variable "rdsh_count" {
  description = "Number of WVD machines to deploy per user"
  default     = 1
}

variable "host_pool_name" {
  description = "Name of the RDS host pool"
  default     = "hostpool-name"
}

variable "vm_prefix" {
  description = "Prefix of the name of the WVD machine(s)"
  default     = "vmhostname"
}

variable "tenant_name" {
  description = "Name of the RDS tenant associated with the machines"
  default     = "tenantname"
}

variable "local_admin_username" {
  description = "Name of the local admin account"
  default     = "localuser"
}

variable "domain_joined" {
  description = "Should the machine join a domain"
  default     = "true"
}

variable "domain_name" {
  description = "Name of the domain to join Ex. Contoso.local"
  default     = "contoso.local"
}

variable "domain_user_upn" {
  description = "UPN of the user to authenticate with the domain. Ex. useradmin"
  default     = "userdomain"
}

variable "domain_password" {
  description = "Password of the user to authenticate with the domain"
  default     = "PassW0rd@@2"
}

variable "tenantLocation" {
  description = "Region in which the RDS tenant exists"
  default     = "eastus2"
}

variable "region" {
  description = "Region in which to deploy these resources"
  default     = "eastus2"
}

variable "resource_group_name" {
  description = "Name of the Resource Group in which to deploy these resources"
  default     = "rg-service-prd-001"
}


variable "existing_tenant_group_name" {
  description = "Name of the existing tenant group"
  default     = "Default Tenant Group"
}


variable "vm_size" {
  description = "Size of the machine to deploy"
  default     = "Standard_B2ms"
}


variable "subnet_id" {
  description = "ID of the Subnet in which the machines will exist"
  default     = "subnet_id"
}


variable "tenant_app_id" {
  description = "User tenant app"
  default     = "userdomain@contoso.com"
}

variable "tenant_app_password" {
  description = "Password of the tenant app"
  default     = "PassW0rd@@2"
}


variable "aad_tenant_id" {
  description = "ID of the AD tenant"
  default     = "tenant_id"
}

variable "ou_path" {
  description = "OU path to us during domain join"
  default     = "OU=computers,OU=wvd,DC=contoso,DC=local"
}


variable "vm_image_id" {
  description = "ID of the custom image to use"
  default     = "vm_image_id"
}

variable "vm_publisher" {
  description = "Publisher of the vm image"
  default     = "MicrosoftWindowsDesktop"
}

variable "vm_offer" {
  description = "Offer of the vm image"
  default     = "Windows-10"
}

variable "vm_sku" {
  description = "Sku of the vm image"
  default     = "rs5-evd"
}

variable "vm_version" {
  description = "Version of the vm image"
  default     = "latest"
}


variable "vm_timezone" {
  description = "The vm_timezone of the vms"
  default     = "E. South America Standard Time"
}

variable "as_platform_update_domain_count" {
  description = "https://github.com/MicrosoftDocs/azure-docs/blob/master/includes/managed-disks-common-fault-domain-region-list.md"
  default     = 5
}

variable "as_platform_fault_domain_count" {
  description = "https://github.com/MicrosoftDocs/azure-docs/blob/master/includes/managed-disks-common-fault-domain-region-list.md"
  default     = 3
}

variable "extension_custom_script" {
  description = "Should a custom script extension be run on all servers"
  default     = "true"
}

variable "base_url" {
  description = "The URL in which the RDS components exist"
  default     = "https://raw.githubusercontent.com/Azure/RDS-Templates/master/wvd-templates"
}

variable "RDBrokerURL" {
  description = "URL of the RD Broker"
  default     = "https://rdbroker.wvd.microsoft.com"
}

variable "registration_expiration_hours" {
  description = "The expiration time for registration in hours"
  default     = "48"
}

variable "is_service_principal" {
  description = "Is a service principal used for RDS connection"
  default     = "false"
}

variable "description" {
  description = "Description for hostpool"
  default     = "description_hostpool"
}

variable "friendlyname" {
  description = "friendlyname for Hostpool"
  default     = "friendlyname"
}

variable "enablepersistentdesktop" {
  description = "Login persistent - single user per vm. False to use vm pool"
  default     = "true"

}

variable "default_desktop_users" {
  description ="desktops users"
  default ="userdomain@contoso.com"
}
