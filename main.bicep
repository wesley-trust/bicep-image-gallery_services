// Deployment Scope
targetScope = 'subscription'

// Parameters
@description('Desired name for the provisioned resources')
param serviceName string = 'TestingServices'

@description('Desired environment for the service collection of provisioned resources')
param serviceEnvironment string = 'Prod'

@description('Desired deployment identifier of the service collection of provisioned resources')
param serviceDeployment string = '01'

@description('Desired location for each service environment')
param serviceLocation string = 'UK South'

// Module
module TestingServices './bicepmodule-resource_group/main.bicep' = {
  scope: subscription()
  name: '${deployment().name}-${uniqueString(deployment().name)}'
  params: {
    serviceDeployment: serviceDeployment
    serviceEnvironment: serviceEnvironment
    serviceLocation: serviceLocation
    serviceName: serviceName
  }
}
