# =============================================================
# terraform.tfvars.example
# Copier ce fichier en terraform.tfvars et remplir les valeurs
# NE JAMAIS committer terraform.tfvars sur Git !
# =============================================================

proxmox_api_url      = "https://192.168.11.113:8006/api2/json"
proxmox_token_id     = "root@pam"
proxmox_token_secret = "P@ssw0rd"

proxmox_node_master  = "pve"
proxmox_nodes        = ["pve"]

vm_template          = "ubuntu-2204-template"
vm_user              = "admincloud"
ssh_public_key       = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK86lEUxS+t625f1zw5jrnN0Sywaud4C2qlSHNw/W2Lm cloud-prive-ha" 

web_server_count     = 1
dev_server_count     = 1