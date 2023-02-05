// Parameters
@description('Desired location for each service environment')
param resourceLocation string
@description('Desired location for each service environment')
param resourceName string = 'ImageGallery_Bicep'
@description('Desired description for the provisioned resources')
param resourceDescription string = 'Shared images'

// Modules
module Image_gallery_Bicep './bicepmodule-compute_gallery/resources.bicep' = {
  name: '${deployment().name}-${uniqueString(deployment().name)}'
  params: {
    resourceName: resourceName
    resourceDescription: resourceDescription
    resourceLocation: resourceLocation
  }
}
