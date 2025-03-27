require("telescope").setup({
    extensions = {
    lazy = {
      -- Optional theme (the extension doesn't set a default theme)
      theme = "ivy",
      -- Whether or not to show the icon in the first column
      show_icon = true,
      -- Mappings for the actions
      mappings = {
      },
      -- Other telescope configuration options
    
    },
  },
  defaults = { 
        file_ignore_patterns = { 
            "node_modules",
            ".git"
        },
    },
  pickers = {
      find_files = {
         hidden = true
        }
      }
})

require("telescope").load_extension "lazy"
