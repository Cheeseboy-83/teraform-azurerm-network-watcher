output "id" {
  description = "The ID of the network watcher."
  value       = azurerm_network_watcher.nw.id
}

output "name" {
  description = "The name of the network watcher."
  value       = azurerm_network_watcher.nw.name
}

output "location" {
  description = "The location/region where the network watcher is created."
  value       = azurerm_network_watcher.nw.location
}