local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Import common utilities
local utils = require("snippets.utils")
local fn = utils.fn

-- Azure Pipelines publish task snippet
ls.add_snippets('yaml', {
  s("publish-task", {
    t({"  - task: DotNetCoreCLI@2"}),
    t({"", "    displayName: 'Publish .NET Core'"}),
    t({"", "    inputs:"}),
    t({"", "      command: 'publish'"}),
    t({"", "      publishWebProjects: true"}),
    t({"", "      arguments: '--configuration $(buildConfiguration) --output $(build.artifactstagingdirectory)'"}),
    t({"", "      zipAfterPublish: true"}),
    t({""}),
    i(0, ""), -- Final insert node
  }),
})
