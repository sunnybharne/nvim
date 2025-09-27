local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Azure Pipelines basic snippets
ls.add_snippets('yaml', {
  -- Basic pipeline
  s("pipeline", {
    t({"trigger:",""}),
    t({"  branches:",""}),
    t({"    include:",""}),
    t({"    - main",""}),
    t({"    - develop",""}),
    t({"",""}),
    t({"pool:",""}),
    t({"  vmImage: 'ubuntu-latest'",""}),
    t({"",""}),
    t({"variables:",""}),
    t({"  buildConfiguration: 'Release'",""}),
    t({"",""}),
    t({"stages:",""}),
    t({"  - stage: Build",""}),
    t({"    displayName: 'Build stage'",""}),
    t({"    jobs:",""}),
    t({"    - job: Build",""}),
    t({"      displayName: 'Build'",""}),
    t({"      pool:",""}),
    t({"        vmImage: 'ubuntu-latest'",""}),
    t({"      steps:",""}),
    t({"      - task: UseNode@1",""}),
    t({"        inputs:",""}),
    t({"          version: '18.x'",""}),
    t({"      - script: |",""}),
    t({"          npm install",""}),
    t({"          npm run build",""}),
    t({"        displayName: 'Build application'",""})
  }),

  -- PowerShell task
  s("powershell-task", {
    t({"  - task: AzurePowerShell@5",""}),
    t({"    inputs:",""}),
    t({"      azureSubscription: 'serviceconnection'",""}),
    t({"      azurePowerShellVersion: 'LatestVersion'",""}),
    t({"      ScriptType: 'InlineScript'",""}),
    t({"      Inline: |",""}),
    t({"        Write-Host 'Hello from Azure PowerShell'",""}),
    t({"      errorActionPreference: 'stop'",""}),
    t({"      FailOnStandardError: false",""}),
    t({"      pwsh: true",""}),
    t({"      displayName: 'PowerShell Task'",""})
  }),

  -- Azure CLI task
  s("azure-cli-task", {
    t({"  - task: AzureCLI@2",""}),
    t({"    inputs:",""}),
    t({"      azureSubscription: 'serviceconnection'",""}),
    t({"      scriptType: 'bash'",""}),
    t({"      scriptLocation: 'inlineScript'",""}),
    t({"      inlineScript: |",""}),
    t({"        echo 'Hello from Azure CLI'",""}),
    t({"        az --version",""}),
    t({"      displayName: 'Azure CLI Task'",""})
  }),

  -- Build task
  s("build-task", {
    t({"  - task: DotNetCoreCLI@2",""}),
    t({"    displayName: 'Build .NET Core'",""}),
    t({"    inputs:",""}),
    t({"      command: 'build'",""}),
    t({"      projects: '**/*.csproj'",""}),
    t({"      arguments: '--configuration $(buildConfiguration)'",""})
  }),

  -- Test task
  s("test-task", {
    t({"  - task: DotNetCoreCLI@2",""}),
    t({"    displayName: 'Test .NET Core'",""}),
    t({"    inputs:",""}),
    t({"      command: 'test'",""}),
    t({"      projects: '**/*Tests/*.csproj'",""}),
    t({"      arguments: '--configuration $(buildConfiguration) --collect \"XPlat Code Coverage\"'",""}),
    t({"      publishTestResults: true",""})
  }),

  -- Publish task
  s("publish-task", {
    t({"  - task: DotNetCoreCLI@2",""}),
    t({"    displayName: 'Publish .NET Core'",""}),
    t({"    inputs:",""}),
    t({"      command: 'publish'",""}),
    t({"      publishWebProjects: true",""}),
    t({"      arguments: '--configuration $(buildConfiguration) --output $(build.artifactstagingdirectory)'",""}),
    t({"      zipAfterPublish: true",""})
  }),

  -- Publish Artifact task
  s("publish-artifact", {
    t({"  - task: PublishBuildArtifacts@1",""}),
    t({"    displayName: 'Publish Artifacts'",""}),
    t({"    inputs:",""}),
    t({"      PathtoPublish: '$(build.artifactstagingdirectory)'",""}),
    t({"      ArtifactName: 'drop'",""}),
    t({"      publishLocation: 'Container'",""})
  }),

  -- Download Artifact task
  s("download-artifact", {
    t({"  - task: DownloadBuildArtifacts@0",""}),
    t({"    displayName: 'Download Artifacts'",""}),
    t({"    inputs:",""}),
    t({"      buildType: 'current'",""}),
    t({"      downloadType: 'single'",""}),
    t({"      artifactName: 'drop'",""}),
    t({"      downloadPath: '$(System.ArtifactsDirectory)'",""})
  })
})
