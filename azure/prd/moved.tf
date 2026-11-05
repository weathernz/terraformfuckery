moved {
  from = time_static.deployment
  to   = module.environment.time_static.deployment
}

moved {
  from = azurerm_resource_group.main

  to = module.environment.module.resource_group.azurerm_resource_group.main
}

moved {
  from = azurerm_virtual_network.core

  to = module.environment.module.virtual_network.azurerm_virtual_network.core
}

moved {
  from = azurerm_network_security_group.apps-nsg

  to = module.environment.module.virtual_network.azurerm_network_security_group.apps
}

moved {
  from = azurerm_route_table.apps-rt

  to = module.environment.module.virtual_network.azurerm_route_table.apps
}

moved {
  from = azurerm_subnet.apps-snet

  to = module.environment.module.virtual_network.azurerm_subnet.apps
}

moved {
  from = azurerm_subnet_network_security_group_association.apps-nsg-assoc

  to = module.environment.module.virtual_network.azurerm_subnet_network_security_group_association.apps
}

moved {
  from = azurerm_subnet_route_table_association.apps-rt-assoc

  to = module.environment.module.virtual_network.azurerm_subnet_route_table_association.apps
}

