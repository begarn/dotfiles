return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
       "zbirenbaum/copilot.lua", -- or github/copilot.vim
       "nvim-lua/plenary.nvim", -- for curl, log wrapper
    },
    config = function()
      require("CopilotChat").setup(
        {
          debug = true,
        }
      )
    end
  }
}
