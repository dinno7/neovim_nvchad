require "nvchad.mappings"
-- add yours here
local map = vim.keymap.set

-- Global
-- Jump between markdown headers
-- map("n", "gj", [[/^##\+ .*<CR>]], { buffer = true, silent = true })
-- map("n", "gk", [[?^##\+ .*<CR>]], { buffer = true, silent = true })

-- Keep window centered when going up/down
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Paste without overwriting register
map("v", "p", '"_dP')

-- Change text without overwriting register
map({ "n", "v" }, "c", '"_c')

-- Move block
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move Block Up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move Block Down" })

-- Move line
map("i", "<A-j>", "<ESC>V:m '>+1<CR>a", { desc = "Move line down" })
map("i", "<A-k>", "<ESC>V:m '<-2<CR>a", { desc = "Move line up" })
map("n", "<A-j>", "V:m '>+1<CR>", { desc = "Move line down" })
map("n", "<A-k>", "V:m '<-2<CR>", { desc = "Move line up" })

-- Search for highlighted text in buffer
map("v", "//", 'y/<C-R>"<CR>', { desc = "Search for highlighted text" })

-- Copy file paths
map("n", "<leader>cf", '<cmd>let @+ = expand("%")<CR>', { desc = "Copy File Name" })
map("n", "<leader>cp", '<cmd>let @+ = expand("%:p")<CR>', { desc = "Copy File Path" })

map({ "n", "i", "v" }, "<C-s>", "<CMD>w<CR>")

map("n", "Q", "q", { desc = "Mapping macro mode to Q" })
map("n", "q", "", { desc = "Remove q to go macro mode" })

map("v", ">", ">gv", { desc = "Being in visual mode when indent to right" })
map("v", "<", "<gv", { desc = "Being in visual mode when indent to right" })

map("n", "<leader>a", "ggVG", { desc = "Select whole file" })

map("n", "<leader>ii", function()
  vim.lsp.buf.format { async = true }
end, { desc = "LSP formatting" })

-- Resize with arrows
map("n", "<A-Up>", ":resize +5<CR>", { desc = "Resize Horizontal Split Down" })
map("n", "<A-Down>", ":resize -5<CR>", { desc = "Resize Horizontal Split Up" })
map("n", "<A-Right>", ":vertical resize -5<CR>", { desc = "Resize Vertical Split Down" })
map("n", "<A-Left>", ":vertical resize +5<CR>", { desc = "Resize Vertical Split Up" })

map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal width & height" })
map("n", "<leader>sx", "<cmd> close <CR>", { desc = "Close split windows" })
map("n", "<C-w>Q", "<cmd> qa <CR>", { desc = "Close all windows(Exit Neovim)" })

map("n", "<C-h>", "<cmd> NvimTmuxNavigateLeft <CR>", { desc = "Window left" })
map("n", "<C-j>", "<cmd> NvimTmuxNavigateDown <CR>", { desc = "Window down" })
map("n", "<C-k>", "<cmd> NvimTmuxNavigateUp <CR>", { desc = "Window up" })
map("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { desc = "Window right" })
map("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { desc = "Window up" })

map("n", "<M-C-K>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<M-NL>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>o", "o<ESC>", { desc = "New line below" })
map("n", "<leader>O", "O<ESC>", { desc = "New line top" })

map("n", "<C-s>", "<cmd> w <CR>", { desc = "Save file" })
map("n", "<C-z>", "u", { desc = "Undo" })

map("n", "L", "$", { desc = "Go end of the line" })
map("n", "H", "^", { desc = "Go firts of the line" })

map("n", "<C-space>", "<Cmd>NvimTmuxNavigateNext<CR>", { desc = "Window up" })

map("n", "<", "<<", { desc = "Indent backward" })
map("n", ">", ">>", { desc = "Indent forward" })

map({ "n", "v" }, "H", "^", { desc = "Go to the first char at line" })
map({ "n", "v" }, "L", "$", { desc = "Go to the last char at line" })

map("i", "jk", "<ESC>", { desc = "escape insert mode", nowait = true })
map("i", "jj", "<ESC>", { desc = "escape insert mode", nowait = true })
map("i", "kk", "<ESC>", { desc = "escape insert mode", nowait = true })

map("i", "<M-C-V>", "<C-v>", { desc = "Map c-v to alt + ctrl + v" })
map("i", "<C-v>", "<ESC>pa", { desc = "Paste after cursor" })
map({ "i", "n" }, "<C-c>", "<CMD>yank<CR>", { desc = "Copy current line" })

map("i", "<C-z>", "<ESC>u a", { desc = "Undo" })

map("i", "<C-Del>", "<ESC>ldwha", { desc = "Delete word after cursor" })
-- map({ "c", "i" }, "^BS", "<C-W>", { desc = "Delete word backward with ctrl + backspace" })

-- ufo folding:
map("n", "zR", require("ufo").openAllFolds)
map("n", "zM", require("ufo").closeAllFolds)

-- hop easymotion:
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

-- lsp telescope
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
-- map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Show documentation for what is under cursor" })

-- Go.nvim keymaps
map("n", "<leader>gc", ":GoCmt<CR>", { desc = "Go - Add comment for function" })
map("n", "<leader>gta", ":GoAddTag<CR>", { desc = "Go - Add tag for struct" })
map("n", "<leader>gtr", ":GoRmTag<CR>", { desc = "Go - Remove tag from struct" })
map("n", "<leader>gtc", ":GoClearTag<CR>", { desc = "Go - Clear tag from struct" })
map("n", "<leader>gh", ":GoToggleInlay<CR>", { desc = "Go - Toggle inlay hint" })
map("n", "<leader>gfs", ":GoFillStruct<CR>", { desc = "Go - Fill struct" })
map("n", "<leader>gfw", ":GoFillSwitch<CR>", { desc = "Go - Fill switch" })
map("n", "<leader>gfe", ":GoIfErr<CR>", { desc = "Go - Add if error" })
map(
  "n",
  "<leader>gfp",
  ":GoFixPlurals<CR>",
  { desc = "Go - change func foo(b int, a int, r int) -> func foo(b, a, r int)" }
)
