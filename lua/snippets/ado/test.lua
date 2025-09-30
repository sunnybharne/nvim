local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Import common utilities
local utils = require("snippets.utils")
local fn = utils.fn

-- Azure Pipelines test task snippet
ls.add_snippets('yaml', {
  s("test-task", {
    t({"  - task: DotNetCoreCLI@2"}),
    t({"", "    displayName: 'Test .NET Core'"}),
    t({"", "    inputs:"}),
    t({"", "      command: 'test'"}),
    t({"", "      projects: '**/*Tests/*.csproj'"}),
    t({"", "      arguments: '--configuration $(buildConfiguration) --collect \"XPlat Code Coverage\"'"}),
    t({"", "      publishTestResults: true"}),
    t({""}),
    i(0, ""), -- Final insert node
  }),
})
