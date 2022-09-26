// Deployment Scope
//targetScope = 'subscription'

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
param resourceName string = 'Image-gallery_services_bicep'

@description('Desired description for the provisioned resources')
param resourceDescription string = 'Shared images'

// Module
module ImageGalleryServices_Bicep './bicepmodule-resource_group/main.bicep' = {
  scope: subscription()
  name: '${deployment().name}-${uniqueString(deployment().name)}'
  params: {
    serviceDeployment: serviceDeployment
    serviceEnvironment: serviceEnvironment
    serviceLocation: serviceLocation
    serviceName: serviceName
  }
}

// Resources
resource Image_gallery_bicep 'Microsoft.Compute/galleries@2020-09-30' = {
  name: resourceName
  location: serviceLocation
  properties: {
    description: resourceDescription
  }
}
