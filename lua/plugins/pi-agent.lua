return {
  {
    "sunnybharne/pi-agent.nvim",
    cmd = {
      "PiAgent",
      "PiAgentChat",
      "PiAgentCLI",
      "PiAgentCmd",
      "PiAgentActions",
      "PiAgentAsk",
      "PiAgentBuffer",
      "PiAgentSelection",
      "PiAgentEdit",
      "PiAgentLogin",
      "PiAgentStatus",
    },
    keys = {
      { "<leader>aa", "<cmd>PiAgentActions<cr>", desc = "Pi Agent actions" },
      { "<leader>ac", "<cmd>PiAgentChat Toggle<cr>", desc = "Toggle Pi Agent chat" },
      { "<leader>ai", "<cmd>PiAgent<cr>", desc = "Pi Agent inline" },
      { "<leader>aq", "<cmd>PiAgentAsk<cr>", desc = "Ask Codex" },
      { "<leader>ab", "<cmd>PiAgentBuffer<cr>", desc = "Ask with buffer" },
      { "<leader>as", ":PiAgentSelection<cr>", mode = "v", desc = "Ask with selection" },
      { "<leader>ae", ":PiAgentEdit<cr>", mode = "v", desc = "Edit selection" },
      { "<leader>aC", "<cmd>PiAgentCLI<cr>", desc = "Open Codex CLI" },
      { "<leader>a:", "<cmd>PiAgentCmd<cr>", desc = "Generate Vim command" },
      { "<leader>al", "<cmd>PiAgentLogin<cr>", desc = "Codex login" },
      { "<leader>at", "<cmd>PiAgentStatus<cr>", desc = "Codex status" },
    },
    config = function()
      require("pi_agent").setup({
        sandbox = "read-only",
        approval = "never",
      })
    end,
  },
}
