return {
    "ggandor/leap.nvim",
    keys = {
        { "s", "<Plug>(leap-forward-to)", mode = { "n", "x", "o" }, desc = "Leap forward to" },
        { "S", "<Plug>(leap-backward-to)", mode = { "n", "x", "o" }, desc = "Leap backward to" },
        { "x", "<Plug>(leap-forward-till)", mode = { "x", "o" }, desc = "Leap forward till" },
        { "X", "<Plug>(leap-backward-till)", mode = { "x", "o" }, desc = "Leap backward till" },
        { "gs", "<Plug>(leap-from-window)", mode = { "n", "x", "o" }, desc = "Leap from window" },
    },
    config = function()
        require("leap").setup({
            -- Highlight groups for labels
            highlight_unlabeled_phase_one_targets = false,
            max_highlighted_traversal_targets = 10,
            case_sensitive = false,
            equivalence_classes = { " \t\r\n" },
            substitute_chars = {},
            safe_labels = { "s", "f", "n", "u", "t", "/", "S", "F", "L", "N", "H", "M", "U", "G", "T", "?", "Z" },
            labels = { "s", "f", "n", "j", "k", "l", "h", "o", "d", "w", "e", "m", "b", "u", "y", "v", "r", "g", "t", "c", "x", "z", "a", "q", "p", "i", "a", "s", "d", "f", "g", "h", "j", "k", "l", "z", "x", "c", "v", "b", "n", "m" },
            special_keys = {
                next_target = "<enter>",
                prev_target = "<tab>",
                next_group = "<space>",
                prev_group = "<tab>",
                multi_accept = "<enter>",
                multi_revert = "<backspace>",
            },
        })
    end,
}
