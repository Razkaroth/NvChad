-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "aquarium",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
  nvdash = {
    header = {
            "██████╗  █████╗ ███████╗██╗  ██╗ █████╗ ██████╗  ██████╗ ████████╗██╗  ██╗",
      "██╔══██╗██╔══██╗╚══███╔╝██║ ██╔╝██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝██║  ██║",
      "██████╔╝███████║  ███╔╝ █████╔╝ ███████║██████╔╝██║   ██║   ██║   ███████║",
      "██╔══██╗██╔══██║ ███╔╝  ██╔═██╗ ██╔══██║██╔══██╗██║   ██║   ██║   ██╔══██║",
      "██║  ██║██║  ██║███████╗██║  ██╗██║  ██║██║  ██║╚██████╔╝   ██║   ██║  ██║",
      "╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝",
      "                          'Tis but a scratch.                             ",
    }
  },
  tabufline = {
  lazyload = false
  },
  statusline = {
    -- modules arg here is the default table of modules
    overriden_modules = function(modules)
      -- define the somefunction anywhwere in your custom dir, just call it well!
      -- modules[2] = somefunction()

      -- adding a module between 2 modules
      -- Use the table.insert functin to insert at specific index
      -- This will insert a new module at index 2 and previous index 2 will become 3 now

      table.insert(
        modules,
        2,
        (function()
          return "%{ObsessionStatus(' ',' ')}"
        end)()
      )
    end,
  },
}

return M
