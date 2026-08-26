return {
  {
    "sunnybharne/pi-agent.nvim",
    cmd = {
      "PiAgent",
      "PiAgentAsk",
      "PiAgentBuffer",
      "PiAgentSelection",
      "PiAgentLogin",
      "PiAgentStatus",
    },
    keys = {
      { "<leader>aa", "<cmd>PiAgent<cr>", desc = "Open Codex agent" },
      { "<leader>aq", "<cmd>PiAgentAsk<cr>", desc = "Ask Codex" },
      { "<leader>ab", "<cmd>PiAgentBuffer<cr>", desc = "Ask with buffer" },
      { "<leader>as", ":PiAgentSelection<cr>", mode = "v", desc = "Ask with selection" },
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
