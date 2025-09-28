local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local c = ls.choice_node
local i = ls.insert_node
local f = ls.function_node

local function fn(
  args,     -- text from i(2) in this example i.e. { { "456" } }
  parent,   -- parent snippet or parent node
  user_args -- user_args from opts.user_args 
)
   return '[' .. args[1][1] .. user_args .. ']'
end

-- Azure Pipelines basic snippets
ls.add_snippets('yaml', {

  s("trig", {
    i(1), t '<-i(1) ',
    f(fn,  -- callback (args, parent, user_args) -> string
      {2}, -- node indice(s) whose text is passed to fn, i.e. i(2)
      { user_args = { "user_args_value" }} -- opts
    ),
    t ' i(2)->', i(2), t '<-i(2) i(0)->', i(0)
  }),

  s("pipeline", {
    t({"trigger:"}),
    t({"", "  branches:"}),
    t({"", "    include:"}),
    t({"", "    - main"}),
    t({"", ""}),
    t({"", "pool: #'selfhosted'"}),
    t({"", "  vmImage: ubuntu-latest"}),
    t({"", ""}),
    t({"", "stages:"}),
    t({"", "  - stage: "}), i(1, "stage_name"),
    t({"", "    displayName: "}), i(2, "stage name"),
    t({"", "    jobs:"}),
    t({"", "    - job: Job"}),
    t({"", "      displayName: "}), i(3, "job name"),
    t({"", "      steps:"}),
    t({"", "      - script: echo \"Hello World\""}),
    t({"", "        displayName: \"Print Hello World\""})
  }),

  -- PowerShell task
  s("powershell-task", {
    t({"  - task: AzurePowerShell@5"}),
    t({"", "    inputs:"}),
    t({"", "      azureSubscription: 'serviceconnection'"}),
    t({"", "      azurePowerShellVersion: 'LatestVersion'"}),
    t({"", "      ScriptType: 'InlineScript'"}),
    t({"", "      Inline: |"}),
    t({"", "        Write-Host 'Hello from Azure PowerShell'"}),
    t({"", "      errorActionPreference: 'stop'"}),
    t({"", "      FailOnStandardError: false"}),
    t({"", "      pwsh: true"}),
    t({"", "      displayName: 'PowerShell Task'"})
  }),

  -- Azure CLI task
  s("azure-cli-task", {
    t({"  - task: AzureCLI@2"}),
    t({"", "    inputs:"}),
    t({"", "      azureSubscription: 'serviceconnection'"}),
    t({"", "      scriptType: 'bash'"}),
    t({"", "      scriptLocation: 'inlineScript'"}),
    t({"", "      inlineScript: |"}),
    t({"", "        echo 'Hello from Azure CLI'"}),
    t({"", "        az --version"}),
    t({"", "      displayName: 'Azure CLI Task'"})
  }),

  -- Build task
  s("build-task", {
    t({"  - task: DotNetCoreCLI@2"}),
    t({"", "    displayName: 'Build .NET Core'"}),
    t({"", "    inputs:"}),
    t({"", "      command: 'build'"}),
    t({"", "      projects: '**/*.csproj'"}),
    t({"", "      arguments: '--configuration $(buildConfiguration)'"})
  }),

  -- Test task
  s("test-task", {
    t({"  - task: DotNetCoreCLI@2"}),
    t({"", "    displayName: 'Test .NET Core'"}),
    t({"", "    inputs:"}),
    t({"", "      command: 'test'"}),
    t({"", "      projects: '**/*Tests/*.csproj'"}),
    t({"", "      arguments: '--configuration $(buildConfiguration) --collect \"XPlat Code Coverage\"'"}),
    t({"", "      publishTestResults: true"})
  }),

  -- Publish task
  s("publish-task", {
    t({"  - task: DotNetCoreCLI@2"}),
    t({"", "    displayName: 'Publish .NET Core'"}),
    t({"", "    inputs:"}),
    t({"", "      command: 'publish'"}),
    t({"", "      publishWebProjects: true"}),
    t({"", "      arguments: '--configuration $(buildConfiguration) --output $(build.artifactstagingdirectory)'"}),
    t({"", "      zipAfterPublish: true"})
  }),

  -- Publish Artifact task
  s("publish-artifact", {
    t({"  - task: PublishBuildArtifacts@1"}),
    t({"", "    displayName: 'Publish Artifacts'"}),
    t({"", "    inputs:"}),
    t({"", "      PathtoPublish: '$(build.artifactstagingdirectory)'"}),
    t({"", "      ArtifactName: 'drop'"}),
    t({"", "      publishLocation: 'Container'"})
  }),

  -- Download Artifact task
  s("download-artifact", {
    t({"  - task: DownloadBuildArtifacts@0"}),
    t({"", "    displayName: 'Download Artifacts'"}),
    t({"", "    inputs:"}),
    t({"", "      buildType: 'current'"}),
    t({"", "      downloadType: 'single'"}),
    t({"", "      artifactName: 'drop'"}),
    t({"", "      downloadPath: '$(System.ArtifactsDirectory)'"})
  }),

})
