-----------------------------------------------------------
-- Импорт модулей Lua
-----------------------------------------------------------
if vim.env.NIX_ON_DROID == "1" then
  require('nix-on-droid/init')
end

require('settings')
require('plugins')
require('plugins-settings')
require('keymaps')
