targetScope = 'tenant'

@description ('Name of the management group to create')
param managementGroupsName string

@description ('ID of the parent management group')
param managementGroupsParentId string

resource symbolicname 'Microsoft.Management/managementGroups@2021-04-01' = {
  name: 'mgmtGroups-${managementGroupsName}'
  scope: tenant()
  properties: {
    details: {
      parent: {
        id: managementGroupsParentId
      }
    }
    displayName: managementGroupsName
  }
}
