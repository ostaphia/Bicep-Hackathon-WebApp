param location string = resourceGroup().location
//param apiName string = 'HackerAPI'
param serviceName string = 'myAppServicePlan'
param appName string = 'hackerTruong588'


resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: serviceName
  location: location
  kind: 'linux'
  sku: {
    name: 'F1'
  }
  properties: {
    reserved: true
  }
}

  
  resource appServiceFront 'Microsoft.Web/sites@2022-03-01' = {
    name: appName
    location: location
    properties: {
      serverFarmId: appServicePlan.id
      httpsOnly: false
    }
  }
   
  // resource appServiceAPI 'Microsoft.Web/sites@2022-03-01' = {
  //   name: apiName
  //   location: location
  //   properties: {
  //     serverFarmId: appServicePlan.id
  //     siteConfig: {
  //       ftpsState: 'FtpsOnly'
  //     }
  //     httpsOnly: true
  //   }
  //   identity: {
  //     type: 'SystemAssigned'
  //   }
  // }

  
