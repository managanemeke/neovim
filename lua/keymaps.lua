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
  { desc = 'git: differences toggle' }
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
  { desc = 'git: undo selected' }
)

---

--- search

vim.keymap.set(
  'n',
  '<leader>sf',
  function()
    require('fzf-lua').files()
  end,
  { desc = 'search: file' }
)
vim.keymap.set(
  'n',
  '<leader>ss',
  function()
    require('fzf-lua').live_grep()
  end,
  { desc = 'search: string' }
)

---

--- ai

vim.keymap.set(
  "v",
  "<leader>ae",
  "<cmd>LLMSelectedTextHandler explain shortly<cr>",
  { desc = 'agent: explain' }
)

---

--- files

vim.keymap.set(
  "n",
  "<leader>f",
  function()
    if vim.bo.filetype == "oil" then
      require("oil").close()
    else
      vim.cmd("Oil")
    end
  end,
  { desc = "files: toggle" }
)

---

--- blocks

vim.keymap.set(
  "n",
  "<leader>b",
  "<CMD>TagbarToggle<CR>",
  { desc = "blocks: toggle" }
)

---

--- clipboard

vim.keymap.set(
  {'n', 'x'},
  '<leader>c',
  '"+y',
  { desc = 'clipboard: copy' }
)
vim.keymap.set(
  {'n', 'x'},
  '<leader>v',
  '"+p',
  { desc = 'clipboard: velcro' }
)

---

--- terminal

vim.keymap.set(
  'n',
  '<leader>t',
  ':terminal<CR>a',
  {
    desc = 'terminal: open',
  }
)
vim.keymap.set(
  't',
  'jk',
  [[<C-\><C-n>]],
  {
    desc = "terminal: switch to normal mode"
  }
)

---

--- window

vim.keymap.set(
  'n',
  '<leader>wm',
  '<cmd>MaximizerToggle<CR>',
  {
    silent = true,
    desc = 'window: maximize',
  }
)

---

--- lines

vim.keymap.set(
  'n',
  '<leader>l',
  '<cmd>exec &nu==&rnu? "se nu!" : "se rnu!"<cr>',
  {
    desc = 'lines: toggle',
  }
)

---

--- common

vim.keymap.set(
  'x',
  '.',
  ':normal .<CR>',
  { desc = 'repeat in visual mode' }
)

---

