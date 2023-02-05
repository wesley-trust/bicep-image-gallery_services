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
@description('Desired location for each service environment')
param resourceName string = 'ImageGallery_Bicep'
@description('Desired description for the provisioned resources')
param resourceDescription string = 'Shared images'

// Modules
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

module Image_gallery_Bicep './bicepmodule-compute_gallery/resources.bicep' = {
  scope: resourceGroup(ImageGalleryServices_Bicep.name)
  name: '${deployment().name}-${uniqueString(deployment().name)}'
  params: {
    resourceName: resourceName
    resourceDescription: resourceDescription
    resourceLocation: ImageGalleryServices_Bicep.outputs.location
  }
}
