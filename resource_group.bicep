// Deployment Scope
targetScope = 'subscription'

// Parameters
@description('Desired name for the provisioned resources')
param serviceName string = 'ImageGalleryServices_Bicep'

@description('Desired environment for the service collection of provisioned resources')
param serviceEnvironment string = 'Prod'

@description('Desired deployment identifier of the service collection of provisioned resources')
param serviceDeployment string = '01'

@description('Desired location for each service environment')
param serviceLocation string = 'UK South'

// Module
module ImageGalleryServices_Bicep './bicepmodule-resource_group/resources.bicep' = {
  scope: subscription()
  name: '${deployment().name}-${uniqueString(deployment().name)}'
  params: {
    serviceDeployment: serviceDeployment
    serviceEnvironment: serviceEnvironment
    serviceLocation: serviceLocation
    serviceName: serviceName
  }
}
