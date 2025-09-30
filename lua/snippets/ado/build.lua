local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Import common utilities
local utils = require("snippets.utils")
local fn = utils.fn

-- Azure Pipelines build task snippet
ls.add_snippets('yaml', {
  s("build-task", {
    t({"  - task: DotNetCoreCLI@2"}),
    t({"", "    displayName: 'Build .NET Core'"}),
    t({"", "    inputs:"}),
    t({"", "      command: 'build'"}),
    t({"", "      projects: '**/*.csproj'"}),
    t({"", "      arguments: '--configuration $(buildConfiguration)'"}),
    t({""}),
    i(0, ""), -- Final insert node
  }),
})
