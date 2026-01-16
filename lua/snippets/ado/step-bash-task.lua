local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Azure Pipelines bash task snippet
ls.add_snippets('yaml', {
  s("step-bash-task-lua", {
    t({"    - task: AzureCLI@2"}),
    t({"", "      inputs:"}),
    t({"", "        azureSubscription: '${"}), i(1, "serviceConnection"), t({"}'"}),
    t({"", "        scriptType: 'bash' # 'ps' | 'pscore' | 'batch'"}),
    t({"", "        scriptLocation: 'inlineScript' # 'scriptPath'"}),
    t({"", "        # scriptPath: '/pathtoscript'"}),
    t({"", "        inlineScript: |"}),
    t({"", "            az account set --subscription $(subscriptionIdDev)"}),
    t({"", "            cd policies/definitions/dev-plb-root"}),
    t({"", ""}),
    t({"", "            # Get Azure context and set ARM variables for Azure provider authentication"}),
    t({"", "            SUBSCRIPTION_ID=$(az account show --query id -o tsv)"}),
    t({"", "            TENANT_ID=$(az account show --query tenantId -o tsv)"}),
    t({"", "            CLIENT_ID=$(az account show --query user.name -o tsv)"}),
    t({"", ""}),
    t({"", "            # Set ARM environment variables for Terraform Azure provider"}),
    t({"", "            export ARM_SUBSCRIPTION_ID=$SUBSCRIPTION_ID"}),
    t({"", "            export ARM_TENANT_ID=$TENANT_ID"}),
    t({"", "            export ARM_CLIENT_ID=$CLIENT_ID"}),
    t({"", "            export ARM_USE_OIDC=true"}),
    t({"", ""}),
    t({"", "            # Unset Azure CLI config to force Terraform to use ARM variables instead of Azure CLI"}),
    t({"", "            unset AZURE_CONFIG_DIR"}),
    t({"", "            "}),
    t({"", "            echo \"ARM_SUBSCRIPTION_ID: $ARM_SUBSCRIPTION_ID\""}),
    t({"", "            echo \"ARM_TENANT_ID: $ARM_TENANT_ID\""}),
    t({"", "            echo \"ARM_CLIENT_ID: $CLIENT_ID\""}),
    t({"", "            echo \"ARM_USE_OIDC: $ARM_USE_OIDC\""}),
    t({"", ""}),
    t({"", "            terraform init"}),
    t({"", "            # terraform force-unlock -force b92aa416-10c4-d4e5-b2ab-c9fc41c1ad87"}),
    t({"", "            terraform plan"}),
    t({"", "            "}), i(2, "echo \"##vso[task.setvariable variable=varname;isoutput=true]varvalue\""),
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

