local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local c = ls.choice_node
local i = ls.insert_node
local f = ls.function_node

-- Import common utilities
local utils = require("snippets.utils")
local fn = utils.fn

-- Azure Pipelines pipeline snippet
ls.add_snippets('yaml', {
  s("pipeline", {
    t({"trigger:"}),
    t({"", "  branches:"}),
    t({"", "    include:"}),
    t({"", "    - main"}),
    t({"", ""}),
    c(1,{
    t({"", "pool: 'selfhosted'"}),
    t({"", "pool:", 
       "  vmImage: 'ubuntu-latest'"}),
    }),
    t({"", ""}),
    t({"", "stages:"}),
    t({"", "  - stage: "}), i(2, "stage_name"),
    t({"", "    displayName: "}), f(fn, {2}),
    t({"", "    jobs:"}),
    t({"", "    - job: "}), i(3, "job_name"),
    t({"", "      displayName: "}), f(fn, {3}),
    t({"", "      steps: "}),
    t({"", "      - script: echo \"Hello World\""}),
    t({"", "        displayName: \"Print Hello World\""}),
    t({"", ""}),
    i(0, ""),
  }),
})
