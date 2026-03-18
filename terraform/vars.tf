variable "location" {
  description = "Azure region"
  default     = "switzerlandnorth"
}

variable "resource_group_name" {
  description = "Resource group for case study"
  default     = "rg-cp2"
}

variable "vm_name" {
  description = "VM name"
  default     = "vm-cp2"
}

variable "vm_admin_username" {
  description = "VM admin username"
  default     = "cp2-user"
}

variable "vm_size" {
  description = "VM size"
  default     = "Standard_B2s_v2"
}

variable "public_key_path" {
  description = "Path to SSH public key"
  default     = "~/.ssh/id_rsa.pub"
}

variable "aks_name" {
  description = "AKS cluster name"
  default     = "aks-cp2"
}

variable "aks_dns_prefix" {
  description = "AKS DNS prefix"
  default     = "aks-cp2-arb"
}

variable "aks_node_count" {
  description = "Number of AKS nodes"
  default     = 1
}

variable "aks_vm_size" {
  description = "AKS node VM size"
  default     = "Standard_B2s_v2"
}
