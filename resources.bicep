// Parameters
@description('Desired location for each service environment')
param resourceLocation string = 'UK South'

@description('Desired location for each service environment')
param resourceName string = 'ImageGalleryServices_Bicep'

@description('Desired description for the provisioned resources')
param resourceDescription string = 'Shared images'

// Resources
resource Image_gallery_Bicep 'Microsoft.Compute/galleries@2020-09-30' = {
  name: resourceName
  location: resourceLocation
  properties: {
    description: resourceDescription
  }
}
