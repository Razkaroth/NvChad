require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "LSP - Hover" })

map("n", "k", function()
	return (vim.v.count > 0 and "k" or "gk")
end, { noremap = true, expr = true })

map("n", "j", function()
	return (vim.v.count > 0 and "j" or "gj")
end, { noremap = true, expr = true })

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
map("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "GitAlchemy - [u]ndotree" })

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
map({ "n", "i", "v" }, "<A-q>", function()
	require("actions-preview").code_actions()
end, { desc = "LSP - Shows code actions menu under cursor" })
map("n", "<leader>lr", ":LspRestart<CR>", { desc = "LSP - Restart the LSP" })

-- Nx
--

map("n", "<leader>nxg", function()
	require("nx.generators").generators({})
end, { desc = "Nx - Run nx generator" })

map("n", "<leader>nxa", function()
	require("nx.actions").actions_finder({})
end, { desc = "Nx - Run nx action" })

map("n", "<leader>nr", "<cmd>Telescope resume<CR>", { desc = "Telescope resume" })

local telescope = require("telescope.builtin")
local nxg_last = 0
local nxg_resume = function()
	if nxg_last == 0 then
		nxg_last = 1
		require("nx.generators").generators({}) -- default fallback
	else
		telescope.resume()
	end
end
map("n", "<leader><leader>nxg", nxg_resume, { desc = "Nx - Run last nx generator" })

map("n", "<leader>ra", vim.lsp.buf.rename, { desc = "LSP - Rename" })

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

-- Vertical centering
local centered = false

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
	group = vim.api.nvim_create_augroup("AutoCenter", {}),
	callback = function()
		if centered then
			vim.cmd("normal! zz")
		end
	end,
})

vim.api.nvim_create_user_command("ToggleAutocenter", function()
	centered = not centered
	if centered then
		print("Autocentering enabled")
	else
		print("Autocentering disabled")
	end
end, {})

map("n", "<leader>zc", ":ToggleAutocenter<CR>", { desc = "General - Toggle autocenter" })

-- slugifier
local slugify = function(text)
	text = text:lower()
	-- Remove disallowed characters.
	text = text:gsub("[^ a-zA-Z0-9_-]+", "")
	-- Convert spaces and multiple `_` to a single `_`.
	text = text:gsub("[ _]+", "_")
	-- Remove dashes and underscores from the beginning and end.
	text = text:gsub("^[ _-]+", "")
	text = text:gsub("[ _-]+$", "")
	return text
end

local slugify_line = function()
	local line = vim.api.nvim_get_current_line()
	local slugified = slugify(line)
	vim.api.nvim_set_current_line(slugified)
end

vim.api.nvim_create_user_command("slugifyCurrentLine", sluggify_line, {})

map("n", "<leader>rs", ":slugifyCurrentLine<CR>", { desc = "General - Slugify current line" })

-- Function to slugify selected text in visual mode, preserving other parts of the lines
local function slugify_visual_selection()
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")

	-- print("Start Position:", vim.inspect(start_pos))
	-- print("End Position:", vim.inspect(end_pos))

	local start_line, start_col = start_pos[2], start_pos[3]
	local end_line, end_col = end_pos[2], end_pos[3]

	-- print("Start Line:", start_line, "Start Col:", start_col)
	-- print("End Line:", end_line, "End Col:", end_col)

	-- Get selected text
	local lines = vim.fn.getline(start_line, end_line)
	-- print("Selected Lines:", vim.inspect(lines))

	if #lines == 1 then
		-- Single line selection
		local line = lines[1]
		local selected_text = line:sub(start_col, end_col)
		-- print("Selected Text:", selected_text)
		local slugified = sluggify(selected_text)
		-- print("slugified Text:", sluggified)
		local new_line = line:sub(1, start_col - 1) .. slugified .. line:sub(end_col + 1)
		vim.fn.setline(start_line, new_line)
	else
		-- Multi-line selection
		local first_line = lines[1]
		local last_line = lines[#lines]
		lines[1] = first_line:sub(1, start_col - 1) .. slugify(first_line:sub(start_col))
		lines[#lines] = slugify(last_line:sub(1, end_col)) .. last_line:sub(end_col + 1)
		for i = 2, #lines - 1 do
			lines[i] = slugify(lines[i])
		end
		vim.fn.setline(start_line, lines)
	end

	-- print("Modified Lines:", vim.inspect(vim.fn.getline(start_line, end_line)))
end

vim.api.nvim_create_user_command("slugifyVisualSelection", function()
	slugify_visual_selection()
end, {})

map("v", "<leader>rs", function ()
  slugify_visual_selection()
end, { desc = "General - slugify visual selection", noremap = true })

-- Lorem Ipsum dolor sit amet
