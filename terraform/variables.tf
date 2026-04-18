# =============================================================
# variables.tf — Déclaration de toutes les variables
# =============================================================

# --- Connexion Proxmox ---
variable "proxmox_api_url" {
  description = "URL de l'API Proxmox (ex: https://10.10.30.1:8006/api2/json)"
  type        = string
}

variable "proxmox_token_id" {
  description = "Token API Proxmox (ex: terraform@pam!token-name)"
  type        = string
  sensitive   = true
}

variable "proxmox_token_secret" {
  description = "Secret du token API Proxmox"
  type        = string
  sensitive   = true
}

# --- Nœuds du cluster ---
variable "proxmox_node_master" {
  description = "Nœud Proxmox principal (master)"
  type        = string
  default     = "node-01"
}

variable "proxmox_nodes" {
  description = "Liste de tous les nœuds du cluster"
  type        = list(string)
  default     = ["node-01", "node-02", "node-03"]
}

# --- Template VM ---
variable "vm_template" {
  description = "Nom du template VM Cloud-Init (Ubuntu 22.04)"
  type        = string
  default     = "ubuntu-2204-cloudinit"
}

# --- Accès SSH ---
variable "vm_user" {
  description = "Utilisateur par défaut des VMs"
  type        = string
  default     = "admincloud"
}

variable "ssh_public_key" {
  description = "Clé SSH publique pour accéder aux VMs"
  type        = string
  # Laisser vide ici, définir dans terraform.tfvars
}

# --- Scalabilité ---
variable "web_server_count" {
  description = "Nombre de serveurs web à déployer"
  type        = number
  default     = 2
}

variable "dev_server_count" {
  description = "Nombre de VMs de développement"
  type        = number
  default     = 3
}
