local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Azure Pipelines PowerShell task snippet
ls.add_snippets('yaml', {
  s("step-pwsh-task-lua", {
    t({"    - task: azurepowershell@5"}),
    t({"", "      inputs:"}),
    t({"", "        azureSubscription: '${"}), i(1, "serviceConnection"), t({"}'"}),
    t({"", "        scriptType: 'inlinescript' # 'filepath'"}),
    t({"", "        #scriptPath: '/script.ps1'"}),
    t({"", "        inline: |"}),
    t({"", "          "}), i(2, "echo \"##vso[task.setvariable variable=varname;isoutput=true]varvalue\""),
    t({"", "        #scriptArguments: '-param1 value1 -param2 value2'"}),
    t({"", "        errorActionPreference: 'stop' # 'continue' | 'silentlycontinue'"}),
    t({"", "        failOnStandardError: false"}),
    t({"", "        azurePowerShellVersion:  'latestversion' # 'otherversion'"}),
    t({"", "        #preferredAzurePowerShellVersion: '7.1.0'"}),
    t({"", "        pwsh: true"}),
    t({"", "        workingDirectory: '$(System.DefaultWorkingDirectory)'"}),
    t({"", "      displayName: '"}), i(3, "task displayname"), t({"'"}),
    t({"", "      env:"}),
    t({"", "        KEY: $(VALUE)"}),
    t({"", ""}),
    i(0, ""),
  }),
})

