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

	vim.keymap.del("i", Config.Trigger)

	for i = 1, #Config.UnbindOnEnter do
		vim.keymap.del("i", Config.UnbindOnEnter[i])
	end
	for i = 1, #Config.BindOnEnter do
		vim.keymap.set("i", Config.BindOnEnter[i][1], Config.BindOnEnter[i][2])
	end
	vim.notify("Numpad bindings.  Press " .. Config.Escape .. " to exit.")
end

local function exitLayer1()
	for i = 1, #Config.UnbindOnExit do
		vim.keymap.del("i", Config.UnbindOnExit[i])
	end
	for i = 1, #Config.BindOnExit do
		vim.keymap.set("i", Config.BindOnExit[i][1], Config.BindOnExit[i][2])
	end

	vim.keymap.set("i", Config.Trigger, setLayer1)

	setLayer0()
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
		if layer == 1 then
			exitLayer1()
		end
	end,
})
vim.api.nvim_create_autocmd("InsertCharPre", {
	group = const_augroup,
	callback = function()
		if layer == 1 then
			if vim.v.char == Config.Escape then
				vim.v.char = ""
				exitLayer1()
			else
				local i = string.find(fromchars, vim.v.char, 1, true)
				if i ~= nil then
					local to = string.sub(tochars, i, i)
					vim.v.char = to
				else
					if vim.v.char == Config.ExtraSpacebar then
						vim.v.char = " "
					else
						vim.v.char = "" --don't print anything if it isn't a mapped keyk
					end
				end
			end
		end
	end,
})

return M
