resource "azurerm_resource_group" "main" {
  name     = "rg-terraform-tutorial"
  location = "Australia East"

  tags = {
    Environment = "Tutorial"
    HCPTest     = "ViaPullRequest"
    What        = "in the butt"
  }
}