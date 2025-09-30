local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Import common utilities
local utils = require("snippets.utils")
local fn = utils.fn

-- Azure Pipelines download artifact task snippet
ls.add_snippets('yaml', {
  s("download-artifact", {
    t({"  - task: DownloadBuildArtifacts@0"}),
    t({"", "    displayName: 'Download Artifacts'"}),
    t({"", "    inputs:"}),
    t({"", "      buildType: 'current'"}),
    t({"", "      downloadType: 'single'"}),
    t({"", "      artifactName: 'drop'"}),
    t({"", "      downloadPath: '$(System.ArtifactsDirectory)'"}),
    t({""}),
    i(0, ""), -- Final insert node
  }),
})
