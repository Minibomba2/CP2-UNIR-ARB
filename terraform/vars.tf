variable "location" {
  description = "Azure region"
  default     = "switzerlandnorth"
}

variable "resource_group_name" {
  description = "Nombre del rg"
  default     = "rg-cp2"
}

variable "vm_name" {
  description = "Nombre de la VM"
  default     = "vm-cp2"
}

variable "vm_admin_username" {
  description = "admin user VM"
  default     = "cp2-user"
}

variable "vm_size" {
  description = "Tamaño en la VM"
  default     = "Standard_B2s_v2"
}

variable "public_key_path" {
  description = "Path to SSH public key"
  default     = "~/.ssh/id_rsa.pub"
}

variable "aks_name" {
  description = "Nombre del cluster AKS"
  default     = "aks-cp2"
}

variable "aks_dns_prefix" {
  description = "Prefijo AKS DNS"
  default     = "aks-cp2-arb"
}

variable "aks_node_count" {
  description = "Cantidad de nodos AKS"
  default     = 1
}

variable "aks_vm_size" {
  description = "AKS node VM size"
  default     = "Standard_B2s_v2"
}
