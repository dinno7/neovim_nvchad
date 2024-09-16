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

  hl_add = {
    ["HLOnYank"] = { bg = "#a6e3a1", fg = "#303446" },
  },
  hl_override = {
    Comment = { fg = "#9399b2" },
    ["@comment"] = { fg = "#9399b2" },
    CursorLine = {
      bg = "#24273a",
    },
    Folded = {
      bg = "#363a4f",
    },
    Visual = {
      bg = "#586985",
      fg = "#f7faff",
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

M.term = {
  winopts = { number = false, relativenumber = false },
  sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
  float = {
    relative = "editor",
    row = 0.3,
    col = 0.25,
    width = 0.5,
    height = 0.5,
    border = "single",
  },
}
return M
