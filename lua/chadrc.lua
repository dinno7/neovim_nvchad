-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@class ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",

  transparency = true,

  cmp = {
    icons = true,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
  },

  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    separator_style = "round",
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    order = nil,
    modules = nil,
  },

  tabufline = {
    show_numbers = true,
    buffer_id_index = true,
    icon_colors = true,
  },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    CursorLine = {
      bg = "#2e2e2e",
    },
  },

  nvdash = {
    load_on_startup = true,
    header = {
      [[ ██████████    ███                                ]],
      [[░░███░░░░███  ░░░                                 ]],
      [[ ░███   ░░███ ████  ████████   ████████    ██████ ]],
      [[ ░███    ░███░░███ ░░███░░███ ░░███░░███  ███░░███]],
      [[ ░███    ░███ ░███  ░███ ░███  ░███ ░███ ░███ ░███]],
      [[ ░███    ███  ░███  ░███ ░███  ░███ ░███ ░███ ░███]],
      [[ ██████████   █████ ████ █████ ████ █████░░██████ ]],
      [[░░░░░░░░░░   ░░░░░ ░░░░ ░░░░░ ░░░░ ░░░░░  ░░░░░░  ]],
      [[                                                  ]],
      [[                                                  ]],
      [[                                                  ]],
      [[    █████                                █████    ]],
      [[   ░░███                                ░░███     ]],
      [[    ░███         ██████   ████████    ███████     ]],
      [[    ░███        ░░░░░███ ░░███░░███  ███░░███     ]],
      [[    ░███         ███████  ░███ ░███ ░███ ░███     ]],
      [[    ░███      █ ███░░███  ░███ ░███ ░███ ░███     ]],
      [[    ███████████░░████████ ████ █████░░████████    ]],
      [[   ░░░░░░░░░░░  ░░░░░░░░ ░░░░ ░░░░░  ░░░░░░░░     ]],

      -- [[                                                                       ]],
      -- [[                                                                       ]],
      -- [[                                                                       ]],
      -- [[                                                                       ]],
      -- [[                                                                     ]],
      -- [[       ████ ██████           █████      ██                     ]],
      -- [[      ███████████             █████                             ]],
      -- [[      █████████ ███████████████████ ███   ███████████   ]],
      -- [[     █████████  ███    █████████████ █████ ██████████████   ]],
      -- [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      -- [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      -- [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      -- [[                                                                       ]],
      -- [[                                                                       ]],
      -- [[                                                                       ]],
    },

    buttons = {
      { "󰙅 Files tree", "Spc e", "NvimTreeToggle" },
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
}

return M
