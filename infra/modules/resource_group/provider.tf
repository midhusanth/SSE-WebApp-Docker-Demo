terraform { 
  required_providers {
    azurerm ={
        source = "hashicorp/azurerm"
        version = ">=3.43.0"
    }
  }

  cloud { 
    
    organization = "MG-WepApp-Docker-Demo" 

    workspaces { 
      name = "SSE-WepApp-Docker-Demo" 
    } 
  } 
}

provider "azurerm" {
  features {
    
  }
}