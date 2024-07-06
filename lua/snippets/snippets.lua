local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('all', {
  s("trigger azure devops pipeline", 
    t({
"name: my-first-azure-pipeline",
"trigger: none",
"trigger: ",
"batch: true # Run pipeline in sequence with multiple commits.Address caution.",
"    branches:",
"        include:",
"	      - main",
"	      - feature/* # Wildcard (* , ** and ?)",
"		exclude:",
"          - wip/*",
"    paths:",
"	    include:",
"	      - pipelines/my-first-azure-pipeline*",
"	    exclude:",
"	      - README.md",
"	tags: # This will run when you push a tag. ",
"		include:",
"			- v1.*",
"	    exclude:",
"	      - v1.0",
"pr:",
" branches:",
"   include:",
"      - main",
"   exclude:",
"      - wip/*",
" paths:",
"    include:",
"      - pipelines/my-first-azure-pipeline*",
"    exclude:",
"      - README.md",
" tags:",
"   include:",
"     - v1.*",
"   exclude:",
"     - v1.0",
"resources: # This is redundant here as this is the default behaviour",
"    - repo: self",
    }))
})

ls.add_snippets('all', {
  s("-task azure devops pipeline", 
    t({
"- task: AzurePowerShell@5",
"  inputs:",
"    azureSubscription:",
"    ScriptType: 'FilePath' # 'FilePath' | 'InlineScript'. Script Type. Default: FilePath.",
"    ScriptPath: # string. Optional. Use when ScriptType = FilePath. Script Path. ",
"    Inline: # string. Optional. Use when ScriptType = InlineScript. Inline Script. ",
"    ScriptArguments: # string. Optional. Use when ScriptType = FilePath. Script Arguments. ",
"    errorActionPreference: 'stop' # 'stop' | 'continue' | 'silentlyContinue'. ErrorActionPreference. Default: stop.",
"    FailOnStandardError: false # boolean. Fail on Standard Error. Default: false.",
"    azurePowerShellVersion: 'OtherVersion' # 'LatestVersion' | 'OtherVersion'. Alias: TargetAzurePs. Azure PowerShell Version. Default: OtherVersion.",
"    preferredAzurePowerShellVersion: # string. Alias: CustomTargetAzurePs. Required when TargetAzurePs = OtherVersion. Preferred Azure PowerShell Version. ",
"    pwsh: false # boolean. Use PowerShell Core. Default: false.",
"    validateScriptSignature: false # boolean. Optional. Use when ScriptType = FilePath. Validate script signature. Default: false.",
"    workingDirectory: # string. Working Directory."
    }))
})

ls.add_snippets('all', {
  s("checkout self", 
     t({
"steps:",
 "- checkout: none",
 "- checkout: self",
 "  clean: true",
 "  fetchDepth: 0",
 "  lfs: false  # whether to download Git-LFS files",
 "  submodules: true | recursive",
 "  path: string",
 "  persistCredentials: true",
 "  fetchTags: false"
     }))
 })

ls.add_snippets('all', {
  s("azurecli",
     t({
"    - task: AzureCLI@2",
"      displayName: Azure CLI",
"      inputs:",
"        azureSubscription: <Name of the Azure Resource Manager service connection>",
"        scriptType: ps",
"        scriptLocation: inlineScript",
"        inlineScript: |",
"          az --version",
"          az account show"
     }))
 })
