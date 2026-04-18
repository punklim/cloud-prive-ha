terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.46"
    }
  }
}

provider "proxmox" {
  endpoint  = "https://192.168.11.113:8006/"
  username  = "root@pam"
  password  = var.proxmox_token_secret
  insecure  = true
}

resource "proxmox_virtual_environment_vm" "web_server" {
  name      = "web-prod-01"
  node_name = "pve"

  clone {
    vm_id = 9001
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }

  disk {
    datastore_id = "data-vms"
    interface    = "scsi0"
    size         = 20
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  initialization {
    user_account {
      username = "admincloud"
      keys     = [var.ssh_public_key]
    }
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }
}

resource "proxmox_virtual_environment_vm" "monitoring" {
  name      = "monitoring-01"
  node_name = "pve"

  clone {
    vm_id = 9001
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }

  disk {
    datastore_id = "data-vms"
    interface    = "scsi0"
    size         = 30
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  initialization {
    user_account {
      username = "admincloud"
      keys     = [var.ssh_public_key]
    }
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }
}

resource "proxmox_virtual_environment_vm" "db_server" {
  name      = "db-prod-01"
  node_name = "pve"

  clone {
    vm_id = 9001
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 4096
  }

  disk {
    datastore_id = "data-vms"
    interface    = "scsi0"
    size         = 40
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  initialization {
    user_account {
      username = "admincloud"
      keys     = [var.ssh_public_key]
    }
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }
}