return {
  {
    "sunnybharne/pi-agent.nvim",
    cmd = {
      "PiAgentPanel",
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
    build = "chmod +x bin/pi-agent",
    keys = {
      { "<leader>cc", "<cmd>PiAgentPanel<cr>", desc = "Open Pi Agent panel" },
      { "<leader>cc", ":PiAgentPanel<cr>", mode = "v", desc = "Open Pi Agent panel with selection" },
      { "<leader>aa", "<cmd>PiAgentActions<cr>", desc = "Pi Agent actions" },
      { "<leader>ac", "<cmd>PiAgentChat Toggle<cr>", desc = "Toggle Pi Agent chat" },
      { "<leader>ai", "<cmd>PiAgent<cr>", desc = "Pi Agent inline" },
      { "<leader>aq", "<cmd>PiAgentAsk<cr>", desc = "Ask Pi Agent" },
      { "<leader>ab", "<cmd>PiAgentBuffer<cr>", desc = "Ask with buffer" },
      { "<leader>as", ":PiAgentSelection<cr>", mode = "v", desc = "Ask with selection" },
      { "<leader>ae", ":PiAgentEdit<cr>", mode = "v", desc = "Edit selection" },
      { "<leader>aC", "<cmd>PiAgentCLI<cr>", desc = "Open Pi Agent CLI" },
      { "<leader>a:", "<cmd>PiAgentCmd<cr>", desc = "Generate Vim command" },
      { "<leader>al", "<cmd>PiAgentLogin<cr>", desc = "Pi Agent login" },
      { "<leader>at", "<cmd>PiAgentStatus<cr>", desc = "Pi Agent status" },
    },
    config = function()
      require("pi_agent").setup({
        sandbox = "read-only",
        approval = "never",
      })
    end,
  },
}
