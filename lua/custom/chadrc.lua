---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "aquarium",
  theme_toggle = {
    "aquarium",
    "aquarium",
  },
  nvdash = {
    load_on_startup = true,
    -- set att on header
    -- ██████╗  █████╗ ███████╗██╗  ██╗ █████╗ ██████╗  ██████╗ ████████╗██╗  ██╗
    -- ██╔══██╗██╔══██╗╚══███╔╝██║ ██╔╝██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝██║  ██║
    -- ██████╔╝███████║  ███╔╝ █████╔╝ ███████║██████╔╝██║   ██║   ██║   ███████║
    -- ██╔══██╗██╔══██║ ███╔╝  ██╔═██╗ ██╔══██║██╔══██╗██║   ██║   ██║   ██╔══██║
    -- ██║  ██║██║  ██║███████╗██║  ██╗██║  ██║██║  ██║╚██████╔╝   ██║   ██║  ██║
    -- ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝

    header = {
      "██████╗  █████╗ ███████╗██╗  ██╗ █████╗ ██████╗  ██████╗ ████████╗██╗  ██╗",
      "██╔══██╗██╔══██╗╚══███╔╝██║ ██╔╝██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝██║  ██║",
      "██████╔╝███████║  ███╔╝ █████╔╝ ███████║██████╔╝██║   ██║   ██║   ███████║",
      "██╔══██╗██╔══██║ ███╔╝  ██╔═██╗ ██╔══██║██╔══██╗██║   ██║   ██║   ██╔══██║",
      "██║  ██║██║  ██║███████╗██║  ██╗██║  ██║██║  ██║╚██████╔╝   ██║   ██║  ██║",
      "╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝",
      "                          'Tis but a scratch.                             ",
    },
  },
  tabufline = {
    enabled = false,
    overriden_modules = function(modules)
      -- table.remove(modules, 2)
      modules[2] = "%="
    end,
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

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
