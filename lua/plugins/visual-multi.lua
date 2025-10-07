return {
  'mg979/vim-visual-multi',
  branch = 'master',
  config = function()
    -- Basic configuration for vim-visual-multi
    vim.g.VM_maps = {
      -- Find this word
      ['Find Under'] = '<C-n>',
      ['Find Subword Under'] = '<C-n>',
      
      -- Add cursor up/down
      ['Add Cursor Up'] = '<C-Up>',
      ['Add Cursor Down'] = '<C-Down>',
      
      -- Select all occurrences
      ['Select All'] = '<C-A>',
      
      -- Skip current and go to next
      ['Skip Region'] = 'q',
      ['Remove Region'] = 'Q',
      
      -- Switch between cursor and extend mode
      ['Switch Mode'] = '<Tab>',
      
      -- Navigate between cursors
      ['Find Next'] = 'n',
      ['Find Prev'] = 'N',
      ['Goto Next'] = ']',
      ['Goto Prev'] = '[',
      
      -- Visual mode mappings
      ['Visual Regex'] = '/',
      ['Visual All'] = '<C-A>',
      ['Visual Add'] = '<C-A>',
      ['Visual Find'] = '<C-A>',
      ['Visual Goto'] = '<C-A>',
      ['Visual Reduce'] = '<C-A>',
      ['Visual Skip'] = '<C-A>',
    }
    
    -- Custom key mappings for better integration
    vim.keymap.set('n', '<C-n>', '<Plug>(VM-Find-Under)', { desc = 'Find word under cursor' })
    vim.keymap.set('n', '<C-A>', '<Plug>(VM-Select-All)', { desc = 'Select all occurrences' })
    vim.keymap.set('n', '<C-Up>', '<Plug>(VM-Add-Cursor-Up)', { desc = 'Add cursor up' })
    vim.keymap.set('n', '<C-Down>', '<Plug>(VM-Add-Cursor-Down)', { desc = 'Add cursor down' })
    
    -- Visual mode mappings
    vim.keymap.set('v', '<C-n>', '<Plug>(VM-Find-Subword-Under)', { desc = 'Find subword under cursor' })
    vim.keymap.set('v', '<C-A>', '<Plug>(VM-Select-All)', { desc = 'Select all occurrences' })
    
    -- Insert mode mappings
    vim.keymap.set('i', '<C-n>', '<Plug>(VM-Find-Under)', { desc = 'Find word under cursor' })
  end,
}
