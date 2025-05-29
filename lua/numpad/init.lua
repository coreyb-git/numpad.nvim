local M = {}
local Config = require("numpad.config")

local const_augroup = "numpad"

local fromchars = ""
local tochars = ""

local layer = 0

local function setLayer0()
	if layer ~= 0 then
		layer = 0
		vim.notify("Normal input bindings.")
	end
end

local function setLayer1()
	layer = 1
	vim.notify("Numpad bindings.  Press " .. Config.Escape .. " to exit.")
end

function M.setup(opts)
	for i, v in pairs(opts) do
		Config[i] = v
	end

	fromchars = Config.TopRow
		.. Config.MiddleRow
		.. Config.BottomRow
		.. Config.Zero
		.. Config.Dot
		.. Config.Addition
		.. Config.Subtraction
		.. Config.Multiplication
		.. Config.Division
	tochars = "7894561230.+-*/"

	vim.keymap.set("i", Config.Trigger, setLayer1, {})
end

vim.api.nvim_create_augroup(const_augroup, { clear = true })
vim.api.nvim_create_autocmd("InsertLeave", {
	group = const_augroup,
	callback = function()
		setLayer0()
	end,
})
vim.api.nvim_create_autocmd("InsertCharPre", {
	group = const_augroup,
	callback = function()
		if layer == 1 then
			if vim.v.char == Config.Escape then
				vim.v.char = ""
				setLayer0()
			else
				local i = string.find(fromchars, vim.v.char, 1, true)
				if i ~= nil then
					local to = string.sub(tochars, i, i)
					vim.v.char = to
				end
			end
		end
	end,
})

return M
