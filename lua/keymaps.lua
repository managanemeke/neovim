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
-- <F5> разные вариации нумераций строк, можно переключаться на ходу
map('n', '<F5>', ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', default_opts)

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
-- Fuzzy Search. CTRL+a для поиска по файлам, CTRL+p для поиска по буфферам
map('n', '<C-a>', [[ <cmd>lua require('telescope.builtin').find_files()<cr> ]], default_opts)
map('n', '<C-p>', [[ <cmd>lua require('telescope.builtin').buffers()<cr> ]], default_opts)
-- <S-F5> Греповский поиск слова под курсором
map('n', '<S-F5>', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], default_opts)
-- <S-F4> Греповский поиск слова в модальном окошке
map('n', '<S-F4>', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], default_opts)
-----------------------------------------------------------
-- ФАЙЛЫ
-----------------------------------------------------------
-- <F8>  Показ дерева классов и функций, плагин majutsushi/tagbar
map('n', '<F8>', ':TagbarToggle<CR>', default_opts)
-- <F4> Дерево файлов. Для иконок следует установить Nerd Font
map('n', '<leader>f', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', { desc = 'Toggle files tree' })

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

