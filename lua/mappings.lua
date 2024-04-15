require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map({ "n", "i", "v" }, "<C-s>", "<cmd> wa <cr>", { desc = "General - Save all buffers" })
--
-- tmux navigation
map("n", "<C-h>", ":TmuxNavigateLeft<CR>", { desc = "General - Navigate left" })
map("n", "<C-l>", ":TmuxNavigateRight<CR>", { desc = "General - Navigate right" })
map("n", "<C-j>", ":TmuxNavigateDown<CR>", { desc = "General - Navigate down" })
map("n", "<C-k>", ":TmuxNavigateUp<CR>", { desc = "General - Navigate up" })
-- use ctrl backspace to delete the previous word
map("i", "<S-BS>", "<cmd>db<CR>", { desc = "General - Delete word backwards" })
-- use ctrl delete to delete the next word
map("i", "<S-Del>", "<cmd>dw<CR>", { desc = "General - Delete next word" })

-- windows
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Windows - resize window height -2" })

map("n", "<C-Up>", ":resize +2<CR>", { desc = "Windows - resize window height +2" })

map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Windows - resize window width -2" })

map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Windows - resize window width +2" })

-- Git

map("n", "<leader>G", "<cmd>LazyGit<CR>", { desc = "GitAlchemy - Lazy[G]it" })
map("n", "<leader>u", "<cmd>undotree<CR>", { desc = "GitAlchemy - [u]ndotree" })

-- TODO
map("n", "<leader>td", "<cmd>TodoTelescope<CR>", { desc = "TODO - Search [T]ODOs" })
map("n", "<leader>tr", "<cmd>TodoTrouble<CR>", { desc = "TODO - Search [T]ODOs with Trouble" })

-- open url under cursor in browser
map("n", "<leader>O", function()
	local url = vim.fn.expand("<cWORD>")
	if url ~= "" then
		print("Opening " .. url .. " in browser")
		vim.fn.jobstart("xdg-open " .. url, { detach = true })
	end
end, { desc = "General - Open url under cursor in browser" })

-- Harpoon
--
map("n", "<leader>h", function()
	require("harpoon.ui").nav_file(1)
end, { desc = "Harpoon - Open [1]st file" })

map("n", "<leader>h1", function()
	require("harpoon.ui").nav_file(1)
end, { desc = "Harpoon - Open [1]st file" })

map("n", "<leader>h2", function()
	require("harpoon.ui").nav_file(2)
end, { desc = "Harpoon - Open [2]nd file" })

map("n", "<leader>h3", function()
	require("harpoon.ui").nav_file(3)
end, { desc = "Harpoon - Open [3]rd file" })

map("n", "<leader>h4", function()
	require("harpoon.ui").nav_file(4)
end, { desc = "Harpoon - Open [4]th file" })

map("n", "<leader>h5", function()
	require("harpoon.ui").nav_file(5)
end, { desc = "Harpoon - Open [5]th file" })

map("n", "<leader>hm", function()
	require("harpoon.mark").add_file()
end, { desc = "Harpoon - Add [H]arpoon [M]ark file" })

map("n", "<leader>hu", function()
	require("harpoon.mark").remove_file()
end, { desc = "[H]arpoon file [U]nmark" })

map("n", "<leader>ht", function()
	require("harpoon.ui").toggle_quick_menu()
end, { desc = "[H]arpoon [T]oggle" })

-- LSP
--
map("n", "<A-q>", ":CodeActionMenu<CR>", { desc = "LSP - Shows code actions menu under cursor" })
map("n", "<leader>lr", ":LspRestart<CR>", { desc = "LSP - Restart the LSP" })

map("v", "<A-q>", ":CodeActionMenu<CR>", { desc = "LSP - Shows code actions menu under cursor" })

-- Nx
--

map("n", "<leader>nxg", function()
	require("nx.generators").generators({})
end, { desc = "Nx - Run nx generator" })

map("n", "<leader>nxa", function()
	require("nx.actions").actions_finder({})
end, { desc = "Nx - Run nx action" })

map("n", "<leader>nxl", ":Lazy load nx.nvim<CR>", { desc = "Nx - Lazy load nx" })

map("n", "<leader>nc", function()
	require("ng").goto_component_with_template_file()
end, { desc = "Nx - Go to component class" })

map("n", "<leader>nt", function()
	require("ng").goto_template_for_component()
end, { desc = "Nx - Go to component template" })

-- Tabufline
--
map("n", "<leader>tn", ":tabnew<CR>", { desc = "Tabuffline - New tab" })
map("n", "<leader>tc", ":tabclose<CR>", { desc = "Tabuffline - Close tab" })
map("n", "<leader>to", ":tabonly<CR>", { desc = "Tabuffline - Close other tabs" })
map("n", "<leader>tm", ":tabmove<CR>", { desc = "Tabuffline - Move tab" })
map("n", "<leader>t[", ":tabnext<CR>", { desc = "Tabuffline - Next tab" })
map("n", "<leader>t]", ":tabprevious<CR>", { desc = "Tabuffline - Previous tab" })
map("n", "<leader>tt", ":tabedit<CR>", { desc = "Tabuffline - Edit tab" })
map("n", "<leader>ts", ":tab split<CR>", { desc = "Tabuffline - Split tab" })
map("n", "<leader>tv", ":vsplit<CR>", { desc = "Tabuffline - Vertical split tab" })
map("n", "<leader>t1", ":tabnext 1<CR>", { desc = "Tabuffline - Tab 1" })
map("n", "<leader>t2", ":tabnext 2<CR>", { desc = "Tabuffline - Tab 2" })
map("n", "<leader>t3", ":tabnext 3<CR>", { desc = "Tabuffline - Tab 3" })
map("n", "<leader>t4", ":tabnext 4<CR>", { desc = "Tabuffline - Tab 4" })
map("n", "<leader>t5", ":tabnext 5<CR>", { desc = "Tabuffline - Tab 5" })
map("n", "<leader>t6", ":tabnext 6<CR>", { desc = "Tabuffline - Tab 6" })
map("n", "<leader>t7", ":tabnext 7<CR>", { desc = "Tabuffline - Tab 7" })
map("n", "<leader>t8", ":tabnext 8<CR>", { desc = "Tabuffline - Tab 8" })
map("n", "<leader>t9", ":tabnext 9<CR>", { desc = "Tabuffline - Tab 9" })
