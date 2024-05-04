return {
  "rmagatti/auto-session",
  config = function()
    local function restore_nvim_tree()
      local nvim_tree = require('nvim-tree')
      nvim_tree.change_dir(vim.fn.getcwd())
    end

    local auto_session = require("auto-session")

    auto_session.setup({
      auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop/" },
      post_restore_cmds = { restore_nvim_tree, "NvimTreeOpen", "NvimTreeRefresh" },
    })
  end,
}
