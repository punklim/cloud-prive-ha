output "web_server_ip" {
  value = proxmox_virtual_environment_vm.web_server.ipv4_addresses
}

output "monitoring_ip" {
  value = proxmox_virtual_environment_vm.monitoring.ipv4_addresses
}

output "db_server_ip" {
  value = proxmox_virtual_environment_vm.db_server.ipv4_addresses
}