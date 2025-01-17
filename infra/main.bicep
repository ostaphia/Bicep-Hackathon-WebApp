@description('Specifies the location for resources.')
param location string = resourceGroup().location
//param apiName string = 'HackerAPI'
param serviceName string = 'myAppServicePlan'
param serviceNameAPI string = 'myAppServicePlanAPI'
param appName string = 'hackathon-truongsahay-app'
param apiName string = 'hackathon-truongsahay-api'


resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: serviceName
  location: 'eastus'
  kind: 'linux'
  sku: {
    name: 'F1'
  }
}

  resource appServiceFront 'Microsoft.Web/sites@2020-06-01' = {
    name: appName
    location: 'eastus'
    properties: {
      serverFarmId: appServicePlan.id
    }
  }

  resource appServicePlanAPI 'Microsoft.Web/serverfarms@2020-06-01' = {
    name: serviceNameAPI
    location: location
    kind: 'linux'
    sku: {
      name: 'F1'
    }
  }
    

  resource appServiceAPI 'Microsoft.Web/sites@2020-06-01' = {
    name: apiName
    location: location
    properties: {
      serverFarmId: appServicePlanAPI.id
    }
  }


  
