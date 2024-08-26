require "nvchad.mappings"
-- add yours here
local map = vim.keymap.set

-- INFO: Keep window centered when going up/down
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- INFO: Paste without overwriting register
map("v", "p", '"_dP')

-- INFO: Change text without overwriting register
map({ "n", "v" }, "c", '"_c')

-- INFO: Change text without overwriting register
map({ "n", "v" }, "x", '"_x')

-- INFO: Move block
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move Block Up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move Block Down" })

-- INFO: Move line
map("i", "<A-j>", "<ESC>V:m '>+1<CR>a", { desc = "Move line down" })
map("i", "<A-k>", "<ESC>V:m '<-2<CR>a", { desc = "Move line up" })
map("n", "<A-j>", "V:m '>+1<CR>", { desc = "Move line down" })
map("n", "<A-k>", "V:m '<-2<CR>", { desc = "Move line up" })

-- INFO: Search for highlighted text in buffer
map("v", "//", 'y/<C-R>"<CR>', { desc = "Search for highlighted text" })

-- INFO: Copy file paths
map("n", "<leader>cf", '<cmd>let @+ = expand("%")<CR>', { desc = "Copy File Name" })
map("n", "<leader>cp", '<cmd>let @+ = expand("%:p")<CR>', { desc = "Copy File Path" })

-- INFO: Fix lsp bug with macro mode
map("n", "q", "", { desc = "Remove q to go macro mode" })
map("n", "Q", "q", { desc = "Mapping macro mode to Q" })

-- INFO: Select whole file
map("n", "<leader>a", "ggVG", { desc = "Select whole file" })

-- INFO: LSP format
map("n", "<leader>ii", function()
  vim.lsp.buf.format { async = true }
end, { desc = "LSP formatting" })

-- INFO: Close all files(exit neovim)
map("n", "<C-w>Q", "<cmd>qa<CR>", { desc = "Close all windows(Exit Neovim)" })

-- INFO: Resize split windows with arrows
map("n", "<A-Up>", ":resize +5<CR>", { desc = "Resize Horizontal Split Down" })
map("n", "<A-Down>", ":resize -5<CR>", { desc = "Resize Horizontal Split Up" })
map("n", "<A-Right>", ":vertical resize -5<CR>", { desc = "Resize Vertical Split Down" })
map("n", "<A-Left>", ":vertical resize +5<CR>", { desc = "Resize Vertical Split Up" })

-- INFO: Split windows keymaps
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal width & height" })
map("n", "<leader>sx", "<cmd> close <CR>", { desc = "Close split windows" })

-- INFO: Set tmux-navigator keymaps -> Make compatible Nvim with Tmux
map("n", "<C-h>", "<cmd> NvimTmuxNavigateLeft <CR>", { desc = "Window left" })
map("n", "<C-j>", "<cmd> NvimTmuxNavigateDown <CR>", { desc = "Window down" })
map("n", "<C-k>", "<cmd> NvimTmuxNavigateUp <CR>", { desc = "Window up" })
map("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { desc = "Window right" })
map("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { desc = "Window up" })

-- INFO: Navigate between buffers with shift + ctrl + j/k
map("n", "<M-C-K>", function()
  require("nvchad.tabufline").next()
end, { desc = "Buffer - goto next" })
map("n", "<M-NL>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Buffer - goto prev" })

-- INFO: Enter new line in normal mode
map("n", "<leader>o", "o<ESC>", { desc = "New-line below" })
map("n", "<leader>O", "O<ESC>", { desc = "New-line top" })

-- INFO: Indent with just one > and < in normal mode
map("n", "<", "<<", { desc = "Indent backward" })
map("n", ">", ">>", { desc = "Indent forward" })
map("v", ">", ">gv", { desc = "Being in visual mode when indent to right" })
map("v", "<", "<gv", { desc = "Being in visual mode when indent to right" })

-- INFO: Go to start and end of the line with shift + H/L in normal and visual mode
map({ "n", "v" }, "H", "^", { desc = "Go to the first char at line" })
map({ "n", "v" }, "L", "$", { desc = "Go to the last char at line" })

-- INFO: Aliases for exit from normal mode
map("i", "jk", "<ESC>", { desc = "escape insert mode", nowait = true })
map("i", "jj", "<ESC>", { desc = "escape insert mode", nowait = true })
map("i", "kk", "<ESC>", { desc = "escape insert mode", nowait = true })

-- INFO: Add ctrl + v as paste in insert mode
map("i", "<M-C-V>", "<C-v>", { desc = "Map c-v to alt + ctrl + v" })
map("i", "<C-v>", "<ESC>pa", { desc = "Paste after cursor" })

-- INFO: Copy current line with ctrl + c in normal and insert and visual mode
map("i", "<C-c>", "<CMD>yank<CR>", { desc = "Copy current line" })
map({ "n", "v" }, "<C-c>", ":yank<CR>", { desc = "Copy current line" })

-- INFO: Save file with ctrl + s
map({ "n", "i", "v" }, "<C-s>", "<CMD>w<CR>", { desc = "Save file" })

-- INFO: Undo with ctrl + z
map({ "i", "n", "v" }, "<C-z>", "<cmd>undo<cr>", { desc = "Undo" })
map({ "i", "n", "v" }, "<M-C-Z>", "<cmd>redo<cr>", { desc = "Redo" })

-- INFO: Delete word after cursor in insert mode
map("i", "<C-Del>", "<ESC>ldwha", { desc = "Delete word after cursor" })

-- INFO: UFO(pkg) folding:
map("n", "zR", require("ufo").openAllFolds)
map("n", "zM", require("ufo").closeAllFolds)

-- INFO: hop easymotion:
map("n", "<leader><leader>s", "<cmd> HopChar1MW <CR>", { desc = "Search by 1 characters" })
map("n", "<leader><leader>S", "<cmd> HopChar2MW <CR>", { desc = "Search by 2 characters" })
map("n", "<leader><leader>f", "<cmd> HopChar1AC <CR>", { desc = "Find 1 characters forwards" })
map("n", "<leader><leader>F", "<cmd> HopChar1BC <CR>", { desc = "Find 1 characters backwards" })
map("n", "<leader><leader>t", "<cmd> HopChar2ACHO1 <CR>", { desc = "Til 2 characters forwards" })
map("n", "<leader><leader>T", "<cmd> HopChar2BCHO1 <CR>", { desc = "Til 2 characters backwards" })
map("n", "<leader><leader>j", "<cmd> HopLineStartAC <CR>", { desc = "Start of lines forwards" })
map("n", "<leader><leader>k", "<cmd> HopLineStartBC <CR>", { desc = "Start of lines backwards" })
map("n", "<leader><leader>w", "<cmd> HopWordMW <CR>", { desc = "Start of words" })
map("n", "<leader><leader>/", "<cmd> HopPatternMW <CR>", { desc = "Search by pattern" })

-- INFO: lsp + telescope and lsp + lspsaga
map("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "LSP Telescope show refrences" })
map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { desc = "LSP definition" })
map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "LSP implementation" })
map("n", "gf", "<cmd>Lspsaga finder<CR>", { desc = "Show definition, references" })
map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "LSP definition type" })
map("n", "<leader>dd", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show buffer diagnostics" })
map("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Show line diagnostics" })
map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Jump to next diagnostic in buffer" })
map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Jump to prev diagnostic in buffer" })
map("n", "<leader>ra", "<cmd>Lspsaga rename<CR>", { desc = "Smart rename" })
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "See available code actions" })
map("n", "<leader>tt", "<cmd>Lspsaga term_toggle<CR>", { desc = "See available code actions" })
map("n", "K", function()
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line "." - 1 })
  if #diagnostics > 0 then
    require("lspsaga.diagnostic.show"):show_diagnostics { line = true }
  else
    require("lspsaga.hover"):render_hover_doc()
  end
end, { desc = "Show documentation for what is under cursor" })
