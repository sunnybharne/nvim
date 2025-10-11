return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  config = function()
    require("img-clip").setup({
      -- Default options
      default = {
        -- Directory to save images
        dir = "assets/images",
        -- Relative to current file
        relative = true,
        -- Use absolute path
        absolute = false,
        -- Image format
        format = "png",
        -- Image quality (for JPEG)
        quality = 85,
        -- Prefix for image filename
        prefix = "",
        -- Suffix for image filename
        suffix = "",
        -- Use timestamp in filename
        timestamp = true,
        -- Use UUID in filename
        uuid = false,
        -- Use random string in filename
        random = false,
        -- Use original filename
        original = false,
        -- Use clipboard content as filename
        clipboard = false,
        -- Use prompt for filename
        prompt = false,
        -- Use selection as filename
        selection = false,
        -- Use current line as filename
        line = false,
        -- Use current word as filename
        word = false,
        -- Use current paragraph as filename
        paragraph = false,
        -- Use current sentence as filename
        sentence = false,
        -- Use current line number as filename
        line_number = false,
        -- Use current column number as filename
        column_number = false,
        -- Use current buffer name as filename
        buffer_name = false,
        -- Use current file name as filename
        file_name = false,
        -- Use current file extension as filename
        file_extension = false,
        -- Use current file directory as filename
        file_directory = false,
        -- Use current file path as filename
        file_path = false,
        -- Use current file size as filename
        file_size = false,
        -- Use current file modification time as filename
        file_mtime = false,
        -- Use current file access time as filename
        file_atime = false,
        -- Use current file change time as filename
        file_ctime = false,
        -- Use current file birth time as filename
        file_btime = false,
        -- Use current file inode as filename
        file_inode = false,
        -- Use current file device as filename
        file_device = false,
        -- Use current file mode as filename
        file_mode = false,
        -- Use current file uid as filename
        file_uid = false,
        -- Use current file gid as filename
        file_gid = false,
        -- Use current file nlink as filename
        file_nlink = false,
        -- Use current file blocks as filename
        file_blocks = false,
        -- Use current file blksize as filename
        file_blksize = false,
        -- Use current file flags as filename
        file_flags = false,
        -- Use current file gen as filename
        file_gen = false,
        -- Use current file lsparse as filename
        file_lsparse = false,
        -- Use current file qwparse as filename
        file_qwparse = false,
        -- Use current file rdev as filename
        file_rdev = false,
        -- Use current file size as filename
        file_size = false,
        -- Use current file atime as filename
        file_atime = false,
        -- Use current file mtime as filename
        file_mtime = false,
        -- Use current file ctime as filename
        file_ctime = false,
        -- Use current file btime as filename
        file_btime = false,
        -- Use current file inode as filename
        file_inode = false,
        -- Use current file device as filename
        file_device = false,
        -- Use current file mode as filename
        file_mode = false,
        -- Use current file uid as filename
        file_uid = false,
        -- Use current file gid as filename
        file_gid = false,
        -- Use current file nlink as filename
        file_nlink = false,
        -- Use current file blocks as filename
        file_blocks = false,
        -- Use current file blksize as filename
        file_blksize = false,
        -- Use current file flags as filename
        file_flags = false,
        -- Use current file gen as filename
        file_gen = false,
        -- Use current file lsparse as filename
        file_lsparse = false,
        -- Use current file qwparse as filename
        file_qwparse = false,
        -- Use current file rdev as filename
        file_rdev = false,
      },
      -- File type specific options
      filetypes = {
        markdown = {
          dir = "assets/images",
          relative = true,
          format = "png",
          quality = 85,
          prefix = "",
          suffix = "",
          timestamp = true,
          uuid = false,
          random = false,
          original = false,
          clipboard = false,
          prompt = false,
          selection = false,
          line = false,
          word = false,
          paragraph = false,
          sentence = false,
          line_number = false,
          column_number = false,
          buffer_name = false,
          file_name = false,
          file_extension = false,
          file_directory = false,
          file_path = false,
          file_size = false,
          file_mtime = false,
          file_atime = false,
          file_ctime = false,
          file_btime = false,
          file_inode = false,
          file_device = false,
          file_mode = false,
          file_uid = false,
          file_gid = false,
          file_nlink = false,
          file_blocks = false,
          file_blksize = false,
          file_flags = false,
          file_gen = false,
          file_lsparse = false,
          file_qwparse = false,
          file_rdev = false,
        },
      },
      -- Keymaps
      keymaps = {
        -- Paste image from clipboard
        paste = "<leader>ip",
        -- Paste image from file
        paste_file = "<leader>if",
        -- Paste image from URL
        paste_url = "<leader>iu",
        -- Paste image from selection
        paste_selection = "<leader>is",
        -- Paste image from prompt
        paste_prompt = "<leader>ipp",
        -- Paste image from line
        paste_line = "<leader>il",
        -- Paste image from word
        paste_word = "<leader>iw",
        -- Paste image from paragraph
        paste_paragraph = "<leader>iap",
        -- Paste image from sentence
        paste_sentence = "<leader>ias",
        -- Paste image from line number
        paste_line_number = "<leader>iln",
        -- Paste image from column number
        paste_column_number = "<leader>icn",
        -- Paste image from buffer name
        paste_buffer_name = "<leader>ibn",
        -- Paste image from file name
        paste_file_name = "<leader>ifn",
        -- Paste image from file extension
        paste_file_extension = "<leader>ife",
        -- Paste image from file directory
        paste_file_directory = "<leader>ifd",
        -- Paste image from file path
        paste_file_path = "<leader>ifp",
        -- Paste image from file size
        paste_file_size = "<leader>ifs",
        -- Paste image from file modification time
        paste_file_mtime = "<leader>ifm",
        -- Paste image from file access time
        paste_file_atime = "<leader>ifa",
        -- Paste image from file change time
        paste_file_ctime = "<leader>ifc",
        -- Paste image from file birth time
        paste_file_btime = "<leader>ifb",
        -- Paste image from file inode
        paste_file_inode = "<leader>ifi",
        -- Paste image from file device
        paste_file_device = "<leader>ifd",
        -- Paste image from file mode
        paste_file_mode = "<leader>ifm",
        -- Paste image from file uid
        paste_file_uid = "<leader>ifu",
        -- Paste image from file gid
        paste_file_gid = "<leader>ifg",
        -- Paste image from file nlink
        paste_file_nlink = "<leader>ifn",
        -- Paste image from file blocks
        paste_file_blocks = "<leader>ifb",
        -- Paste image from file blksize
        paste_file_blksize = "<leader>ifbs",
        -- Paste image from file flags
        paste_file_flags = "<leader>iff",
        -- Paste image from file gen
        paste_file_gen = "<leader>ifg",
        -- Paste image from file lsparse
        paste_file_lsparse = "<leader>ifls",
        -- Paste image from file qwparse
        paste_file_qwparse = "<leader>ifqw",
        -- Paste image from file rdev
        paste_file_rdev = "<leader>ifr",
      },
    })

    -- Additional keymaps for common use cases
    vim.keymap.set("n", "<leader>im", function()
      require("img-clip").paste_image()
    end, { desc = "Paste image from clipboard" })

    vim.keymap.set("n", "<leader>if", function()
      require("img-clip").paste_image_file()
    end, { desc = "Paste image from file" })

    vim.keymap.set("n", "<leader>iu", function()
      require("img-clip").paste_image_url()
    end, { desc = "Paste image from URL" })
  end,
}

