--         ╭──────────────────────────────────────────────────────────╮
--         │                         EXAMPLES                         │
--         ╰──────────────────────────────────────────────────────────╯

-- ? HI
-- ! HI
-- > HI
-- >> HI
-- INFO HI
-- TODO HI
-- FIX HI
-- > HI

-- > Highlights added in chadrc.lua

-------------------------------
-- local api = vim.api
-- -- Function to apply highlighting
-- local function highlight_comments()
--   local buf = api.nvim_get_current_buf()
--   local lines = api.nvim_buf_get_lines(buf, 0, -1, false)
--
--   for i, line in ipairs(lines) do
--     local comment_start = line:find "%-%-"
--     if comment_start then
--       local comment = line:sub(comment_start + 2) -- Skip the "--"
--       local highlight_group = "Comment"
--
--       local patterns = {
--         { "^%s*%?", "DINNOCommentQuestion" },
--         { "^%s*>%s", "DINNOCommentArrow" },
--         { "^%s*>>", "DINNOCommentDoubleArrow" },
--         { "^%s*!", "DINNOCommentExclamation" },
--         { "^%s*INFO", "DINNOCommentInfo" },
--         { "^%s*TODO", "DINNOCommentTodo" },
--         { "^%s*FIX", "DINNOCommentFix" },
--       }
--
--       for _, pattern in ipairs(patterns) do
--         if comment:match(pattern[1]) then
--           highlight_group = pattern[2]
--           break
--         end
--       end
--
--       -- Apply highlight to the entire comment
--       api.nvim_buf_add_highlight(buf, -1, highlight_group, i - 1, comment_start - 1, -1)
--     end
--   end
-- end
--
-- -- Create autocmd to apply highlighting
-- local comment_highlight_group = api.nvim_create_augroup("DINNOCommentHighlight", { clear = true })
--
-- -- Create autocmd to apply highlighting
-- --"BufEnter", "BufWritePost", "TextChanged", "InsertLeave"
-- api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged", "TextChangedI", "InsertLeave" }, {
--   group = comment_highlight_group,
--   pattern = { "*" },
--   callback = highlight_comments,
-- })
-- ----------------
local api = vim.api

-- Table of comment patterns for different languages
local comment_patterns = {
  lua = "%-%-",
  python = "#",
  javascript = "//",
  typescript = "//",
  cpp = "//",
  c = "//",
  java = "//",
  rust = "//",
  go = "//",
  -- Add more languages as needed
  default = "//", -- Default pattern for unknown filetypes
}

-- Function to get the comment pattern for the current buffer
local function get_comment_pattern()
  local filetype = vim.bo.filetype
  return comment_patterns[filetype] or comment_patterns.default
end

-- Function to apply highlighting to a single line
local function highlight_line(buf, line_num)
  local comment_pattern = get_comment_pattern()
  local comment = api.nvim_buf_get_lines(buf, line_num, line_num + 1, false)[1]
  if comment == nil then
    return
  end
  local highlight_group = "Comment"
  local patterns = {
    { "%?", "DINNOCommentQuestion" },
    { "[^>]>[^>]", "DINNOCommentArrow" },
    { ">>", "DINNOCommentDoubleArrow" },
    { "!", "DINNOCommentExclamation" },
    { "INFO", "DINNOCommentInfo" },
    { "TODO", "DINNOCommentTodo" },
    { "FIX", "DINNOCommentFix" },
  }

  -- Set highlight group
  for _, pattern in ipairs(patterns) do
    if comment:match("^" .. comment_pattern .. "%s*" .. pattern[1]) then
      highlight_group = pattern[2]
      break
    end
  end

  -- Clear existing highlights for this line
  api.nvim_buf_clear_namespace(buf, -1, line_num, line_num - 1)
  -- Apply highlight to the entire comment
  api.nvim_buf_add_highlight(buf, -1, highlight_group, line_num, 0, -1)
end

-- Function to highlight all comments in the buffer
local function highlight_all_comments()
  -- local buf = api.nvim_get_current_buf()
  -- local line_count = api.nvim_buf_line_count(buf)
  -- for i = 0, line_count - 1 do
  --   highlight_line(buf, i)
  -- end

  local pattern = get_comment_pattern()
  local buf = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, true)
  for i, line in ipairs(lines) do
    if vim.fn.match(line, "^" .. pattern) ~= -1 then
      -- line is commented, do something with it
      highlight_line(buf, i - 1)
    end
  end
end

-- Function to handle changes in the buffer
local function on_lines(_, buf, _, first_line, last_line)
  for line_num = first_line, last_line - 1 do
    highlight_line(buf, line_num)
  end
end

-- Create autocmd group
local comment_highlight_group = api.nvim_create_augroup("DINNOCommentHighlight", { clear = true })

-- Create autocmds to apply highlighting
--, "BufWritePost", "FileType"
api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  group = comment_highlight_group,
  pattern = { "*" },
  callback = highlight_all_comments,
})

-- api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
--   group = comment_highlight_group,
--   pattern = { "*" },
--   callback = function()
--     local buf = api.nvim_get_current_buf()
--     api.nvim_buf_attach(buf, false, {
--       on_lines = on_lines,
--     })
--   end,
-- })
