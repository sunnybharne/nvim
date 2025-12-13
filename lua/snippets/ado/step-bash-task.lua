local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Azure Pipelines bash task snippet
ls.add_snippets('yaml', {
  s("ado-step-bash-task", {
    t({"    - task: AzureCLI@2"}),
    t({"", "      inputs:"}),
    t({"", "        azureSubscription: '${"}), i(1, "serviceConnection"), t({"}'"}),
    t({"", "        scriptType: 'bash' # 'ps' | 'pscore' | 'batch'"}),
    t({"", "        scriptLocation: 'inlineScript' # 'scriptPath'"}),
    t({"", "        # scriptPath: '/pathtoscript'"}),
    t({"", "        inlineScript: |"}),
    t({"", "              "}), i(2, "echo \"##vso[task.setvariable variable=varname;isoutput=true]varvalue\""),
    t({"", "        #arguments: # string. Alias: scriptArguments. Script Arguments."}),
    t({"", "        # workingDirectory: '$(System.DefaultWorkingDirectory)'"}),
    t({"", "        #failOnStandardError: false # boolean. Fail on Standard Error. Default: false."}),
    t({"", "      displayName: '"}), i(3, "task displayname"), t({"'"}),
    t({"", "      env:"}),
    t({"", "        KEY: $(VALUE)"}),
    t({"", ""}),
    i(0, ""),
  }),
})

