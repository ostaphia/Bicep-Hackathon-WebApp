@description('Specifies the location for resources.')
param location2 string = 'eastus'

param location string = resourceGroup().location
//param apiName string = 'HackerAPI'
param serviceName string = 'myAppServicePlan'
param serviceName2 string = 'myAppServicePlanAPI'
param appName string = 'hackerTruong588'
param apiName string = 'hackerTruongAPI'


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

resource appServicePlanAPI 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: serviceName2
  location: location2
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
    }
  }

  resource appServiceAPI 'Microsoft.Web/sites@2022-03-01' = {
    name: apiName
    location: location2
    properties: {
      serverFarmId: appServicePlanAPI.id
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

  
