--[[
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = false,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")
--]]

require('telescope').setup{
    defaults = {
        mappings = {
            n = {
                ["<C-c>"] = "close",
                ["<C-s>"] = "select_horizontal"
            },
            i = {
                ["<ESC>"] = "close",
                ["<C-d>"] = "delete_buffer",
                ["<C-s>"] = "select_horizontal"
            }
        }
    }
}
require('telescope').load_extension('coc')
local utils = require('telescope.utils')
local builtin = require('telescope.builtin')

function _G.project_files()
    local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
    if ret == 0 then
        builtin.git_files()
    else
        builtin.find_files()
    end
end
function _G.grep_project()
    local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
    if ret == 0 then
        builtin.live_grep({cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]})
    else
        builtin.live_grep()
    end
end
