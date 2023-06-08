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
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
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

require("nvim-tree").setup()
require("nvim-surround").setup()
require('nvim-autopairs').setup({
    enable_check_bracket_line = false,
    fast_wrap = {},
    ignored_next_char = "",
    map_cr = true,
})
function loc()
    local r,c = unpack(vim.api.nvim_win_get_cursor(0))
    return r..'/'..vim.api.nvim_buf_line_count(0)..':'..c
end
require('lualine').setup{
    options = {
        theme = 'gruvbox_dark',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {{'filename', path = 3}},
        lualine_x = {'encoding', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {loc}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {{'filename', path = 3}},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    }
}
local bufferline = require('bufferline')
bufferline.setup{
    options = {
        style_preset = bufferline.style_preset.no_italic,
        left_mouse_command = "buffer %d",
        middle_mouse_command = "bdelete! %d",
        modified_icon = '●',
        diagnostics = "coc",
        -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                separator = true
            }
        },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        separator_style = "thin",
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        always_show_bufferline = true,
    }
}
