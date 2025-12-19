return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true, -- Show hidden files (dotfiles)
          ignored = false, -- Keep git-ignored files (like node_modules) hidden
        },
      },
    },
  },
}
