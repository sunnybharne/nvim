local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('all', {
  s("trigger azure devops pipeline",
    t({
" some trigger ",
" code ",
" which I dont ",
" know",
    }))
})

