local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('all', {
  s("stages",
    t({
"stages:",
"- stage: A",
"  jobs:",
"  - job: A1",
"    steps:",
"    - bash: echo 'A1'",
"  - job: A2",
"    steps:",
"    - bash: echo 'A2'",
    }))
})

ls.add_snippets('all', {
  s("task-azurecli",
    t({
"    - task: AzureCLI@2",
"      inputs:",
"        azureSubscription: 'serviceConnectionName'",
"        scriptType: ps",
"        scriptLocation: 'inlineScript' #| 'scriptPath'",
"          # scriptPath: ",
"        #arguments: ",
"        inlineScript: |",
"          az deployment tenant create --location swedencentral --parameters management-groups/main.bicepparam",
"        powerShellErrorActionPreference: 'stop' # | 'continue' | 'silentlyContinue'",
    }))
})

ls.add_snippets('all', {
  s("trigger",
    t({
"name: pipelineName",
"",
"trigger:",
"  branches:",
"    include:",
"    - main",
"    - releases/*",
"    - feature/*",
"    exclude:",
"    - releases/old*",
"    - feature/*-working",
"  paths:",
"    include:",
"    - docs",
"    exclude:",
"    - docs/README.md",
"  tags:",
"    include:",
"    - v2.*",
"    exclude:",
"    - v2.0",
"",
"pool:",
"  name: selfhosted",
    }))
})

