return {
  -- Correct Repo Name (Note the 'j' in nickjvandyke)
  "nickjvandyke/opencode.nvim",

  -- Load this plugin only when these keys are pressed
  keys = {
    {
      "<C-a>",
      function()
        require("opencode").ask("@this: ", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "Ask AI (Opencode)",
    },
    {
      "<C-x>",
      function()
        require("opencode").select()
      end,
      mode = { "n", "x" },
      desc = "Opencode Actions",
    },
    {
      "<C-.>",
      function()
        require("opencode").toggle()
      end,
      mode = { "n", "t" },
      desc = "Toggle AI Chat",
    },
    {
      "go",
      function()
        return require("opencode").operator("@this ")
      end,
      mode = { "n", "x" },
      expr = true,
      desc = "Add range to Context",
    },
  },

  dependencies = {
    "folke/snacks.nvim", -- Ensure Snacks is loaded
  },

  -- Configuration runs when the plugin loads
  config = function()
    -- 1. Setup Options via Global Variable (as per plugin docs)
    vim.g.opencode_opts = {
      -- Add custom settings here if needed
      -- example:
      -- model = "gpt-4o",
    }

    -- 2. Enable autoread for file changes
    vim.o.autoread = true

    -- 3. Restore Increment/Decrement mappings (since C-a/C-x are taken)
    vim.keymap.set("n", "+", "<C-a>", { desc = "Increment number", noremap = true })
    vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement number", noremap = true })

    -- 4. Scroll mappings (Optional)
    vim.keymap.set("n", "<S-C-u>", function()
      require("opencode").command("session.half.page.up")
    end, { desc = "Scroll AI Up" })
    vim.keymap.set("n", "<S-C-d>", function()
      require("opencode").command("session.half.page.down")
    end, { desc = "Scroll AI Down" })
  end,
}
