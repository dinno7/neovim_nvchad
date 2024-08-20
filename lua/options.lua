require "nvchad.options"

-- add yours here!

local o = vim.opt

-- o.cursorlineopt ='both' -- to enable cursorline!
o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

o.relativenumber = true

o.colorcolumn = "80"

vim.g.vscode_snippets_standalone_path = "~/.config/nvim/dinno.code-snippets"

-- Highlight in yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 300 }
  end,
})

-- Function to convert binary data to hex view
local function binary_to_hex(binary_string)
  local hex_view = ""
  local ascii_view = ""
  local address = 0

  for i = 1, #binary_string, 16 do
    -- Address
    hex_view = hex_view .. string.format("%08x: ", address)

    -- Hex values
    for j = i, math.min(i + 15, #binary_string) do
      local byte = string.byte(binary_string:sub(j, j))
      hex_view = hex_view .. string.format("%02x ", byte)

      -- ASCII representation
      if byte >= 32 and byte <= 126 then
        ascii_view = ascii_view .. string.char(byte)
      else
        ascii_view = ascii_view .. "."
      end
    end

    -- Pad hex view if less than 16 bytes
    if #binary_string - i + 1 < 16 then
      hex_view = hex_view .. string.rep("   ", 16 - (#binary_string - i + 1))
    end

    hex_view = hex_view .. " " .. ascii_view .. "\n"
    ascii_view = ""
    address = address + 16
  end

  return hex_view
end

-- Function to check if file is binary
local function is_binary(filename)
  local file = io.open(filename, "rb")
  if not file then
    return false
  end

  local chunk = file:read(1024)
  file:close()

  if not chunk then
    return false
  end

  -- Check for null bytes or high number of non-printable characters
  local non_printable = 0
  for i = 1, #chunk do
    local byte = string.byte(chunk:sub(i, i))
    if byte == 0 or (byte < 32 and byte ~= 9 and byte ~= 10 and byte ~= 13) then
      non_printable = non_printable + 1
    end
  end

  return (non_printable / #chunk) > 0.3
end

-- Autocmd to open binary files in hex view
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = "*",
  callback = function()
    local filename = vim.api.nvim_buf_get_name(0)
    if is_binary(filename) then
      -- Read file contents
      local file = io.open(filename, "rb")
      if not file then
        return
      end
      local content = file:read "*all"
      file:close()

      -- Convert to hex view
      local hex_content = binary_to_hex(content)

      -- Replace buffer content with hex view
      vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(hex_content, "\n"))

      -- Set buffer as non-modifiable
      vim.bo.modifiable = false
      vim.bo.modified = false

      -- Set filetype for potential syntax highlighting
      vim.bo.filetype = "hexdump"
    end
  end,
})

-- Optional: Add a command to toggle hex view
vim.api.nvim_create_user_command("ToggleHexView", function()
  if vim.bo.filetype == "hexdump" then
    -- Reopen the file normally
    vim.cmd "edit!"
  else
    -- Trigger the hex view conversion
    local filename = vim.api.nvim_buf_get_name(0)
    if is_binary(filename) then
      vim.cmd "e"
    else
      print "This file is not detected as binary."
    end
  end
end, {})

-- Optional: Map a key to toggle hex view
-- vim.api.nvim_set_keymap("n", "u", ":ToggleHexView<CR>", { noremap = true, silent = true })
