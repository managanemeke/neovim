local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
-----------------------------------------------------------
-- НАВИГАЦИЯ
-----------------------------------------------------------
-- Отключаем стрелочки в Нормальном Режиме. Хардкор!
map('', '<up>', ':echoe "Use hjkl, bro"<CR>', {noremap = true, silent = false})
map('', '<down>', ':echoe "Use hjkl, bro"<CR>', {noremap = true, silent = false})
map('', '<left>', ':echoe "Use hjkl, bro"<CR>', {noremap = true, silent = false})
map('', '<right>', ':echoe "Use hjkl, bro"<CR>', {noremap = true, silent = false})
-- Переключение вкладок с помощью TAB или shift-tab (akinsho/bufferline.nvim)
map('n', '<Tab>', ':BufferLineCycleNext<CR>', default_opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', default_opts)

-----------------------------------------------------------
-- РЕЖИМЫ
-----------------------------------------------------------
-- Выходим в нормальный режим через <jk>, чтобы не тянуться
map('i', 'jk', '<Esc>', {noremap = true, silent = true})
-----------------------------------------------------------
-- ПОИСК
-----------------------------------------------------------
-- Выключить подсветку поиска через комбинацию ,+<space>
map('n', ',<space>', ':nohlsearch<CR>', {noremap = true})

--- git

vim.keymap.set(
  'n',
  '<leader>d',
  function()
    require('inlinediff').toggle()
  end,
  { desc = 'Git: Differences toggle' }
)

vim.keymap.set(
  'v',
  '<leader>u',
  function()
    local s = vim.fn.line('v')
    local e = vim.fn.line('.')
    if s > e then s, e = e, s end
    require('gitsigns').reset_hunk({ s, e })
  end,
  { desc = 'Git: Undo selected' }
)

---

--- search

vim.keymap.set(
  'n',
  '<leader>sf',
  function()
    require('fzf-lua').files()
  end,
  { desc = 'Search file' }
)
vim.keymap.set(
  'n',
  '<leader>ss',
  function()
    require('fzf-lua').live_grep()
  end,
  { desc = 'Search string' }
)

---

--- ai

vim.keymap.set(
  "v",
  "<leader>ae",
  "<cmd>LLMSelectedTextHandler explain shortly<cr>",
  { desc = 'Agent explain' }
)

---

--- files

vim.keymap.set(
  "n",
  "<leader>f",
  "<CMD>Oil<CR>",
  { desc = "Files toggle" }
)
vim.keymap.set(
  "n",
  "<leader>b",
  "<CMD>TagbarToggle<CR>",
  { desc = "Blocks toggle" }
)

---

---
vim.keymap.set({'n', 'x'}, '<leader>c', '"+y', { desc = 'Yank to clipboard' })
vim.keymap.set({'n', 'x'}, '<leader>v', '"+p', { desc = 'Paste from clipboard' })
---
---
vim.keymap.set(
  'n',
  '<leader>t',
  ':terminal<CR>a',
  {
    desc = 'Open terminal in new buffer',
  }
)
vim.keymap.set(
  't',
  'jk',
  [[<C-\><C-n>]],
  {
    desc = "Exit terminal mode"
  }
)
---
---
vim.keymap.set(
  'n',
  '<leader>m',
  '<cmd>MaximizerToggle<CR>',
  {
    silent = true,
    desc = 'Maximize toggle',
  }
)
---
---
vim.keymap.set(
  'n',
  '<leader>l',
  '<cmd>exec &nu==&rnu? "se nu!" : "se rnu!"<cr>',
  {
    desc = 'Lines toggle',
  }
)
---

--- default

vim.keymap.set(
  'x',
  '.',
  ':normal .<CR>',
  { desc = 'Repeat in visual mode' }
)

---

