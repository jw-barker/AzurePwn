resource "azurerm_resource_group" "webapp" {    
  name = "webapprg"    
  location = "eastus"    
}   
resource "azurerm_app_service_plan" "appservice" {  
  name                = "app-service-plan"  
  location            = "eastus"  
  resource_group_name = azurerm_resource_group.webapp.name  
  
  sku {  
    tier = "Standard"  
    size = "S1"  
  }  
}  
  
resource "azurerm_linux_web_app" "app" {  
  name                = "myapp"  
  location            = "uksouth"  
  resource_group_name = azurerm_resource_group.webapp.name  
  app_service_plan_id = azurerm_app_service_plan.appservice.id  
  
  app_settings = {  
    "DeviceName" = "SampleDevice",  
    "DeviceId" = "2"  
  }  
}  

data "archive_file" "file_function_app" {
  type        = "zip"
  source_dir  = "./function-app"
  output_path = "./function-app.zip"
}