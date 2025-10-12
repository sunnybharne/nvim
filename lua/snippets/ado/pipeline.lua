local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local c = ls.choice_node
local i = ls.insert_node
local f = ls.function_node

-- Import common utilities
local utils = require("snippets.utils")
local fn = utils.fn

-- Azure Pipelines snippets
ls.add_snippets('yaml', {
  s("trigger", {
    t({"trigger:"}),
    t({"", "  branches:"}),
    t({"", "    include:"}),
    t({"", "    - main"}),
    t({"", "  paths:"}),
    t({"", "    include:"}),
    t({"", "    - path/**"}),
    t({"", ""}),
    t({"", "pool: 'selfhosted'"}),
    t({"", ""}),
    t({"", "stages:"}),
    t({"", "- stage: "}), i(1, "stage_name"),
    t({"", "  displayName: "}), i(2, "stage_name"),
    t({"", "  jobs:"}),
    t({"", "  - job: "}), i(3, "job_name"),
    t({"", "    displayName: "}), i(4, "job_name"),
    t({"", "    steps: "}),
    t({"", "    - script: echo \"Hello World\""}),
    t({"", "      displayName: \"Print Hello World\""}),
    t({"", ""}),
    i(0, ""),
  }),
  s("stage", {
    t({"stages:"}),
    t({"", "- stage: "}), i(1, "stage_name"),
    t({"", "  displayName: "}), i(2, "stage_name"),
    t({"", "  jobs:"}),
    t({"", "  - job: "}), i(3, "job_name"),
    t({"", "    displayName: "}), i(4, "job_name"),
    t({"", "    steps: "}),
    t({"", "    - script: echo \"Hello World\""}),
    t({"", "      displayName: \"Print Hello World\""}),
    t({"", ""}),
    i(0, ""),
  }),
  s("step-bash", {
    t({"    steps: "}),
    t({"", "    - script: "}), i(1, "echo \"Hello World\""),
    t({"", "      displayName: \""}), i(2, "step-bash"), t({"\""}),
    t({"", ""}),
    i(0, ""),
  }),
  s("step-pwsh", {
    t({"    steps: "}),
    t({"", "    - task: AzurePowerShell@5"}),
    t({"", "      inputs:"}),
    t({"", "        azureSubscription: '"}), i(1, "serviceConnection"), t({"'"}),
    t({"", "        ScriptType: 'InlineScript' # 'FilePath'"}),
    t({"", "        #ScriptPath: '/script.ps1'"}),
    t({"", "        Inline: |"}),
    t({"", "          "}), i(2, "Write-Host \"Hello world\""),
    t({"", "        #ScriptArguments: '-param1 value1 -param2 value2'"}),
    t({"", "        errorActionPreference: 'stop' # 'continue' | 'silentlyContinue'"}),
    t({"", "        FailOnStandardError: false"}),
    t({"", "        azurePowerShellVersion:  'LatestVersion' # 'OtherVersion'"}),
    t({"", "        #preferredAzurePowerShellVersion: '7.1.0'"}),
    t({"", "        pwsh: true"}),
    t({"", "        workingDirectory: '$(System.DefaultWorkingDirectory)'"}),
    t({"", "      displayName: '"}), i(3, "Task displayname"), t({"'"}),
    t({"", ""}),
    i(0, ""),
  }),
})
