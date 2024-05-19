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
        lualine_b = {'branch', 'diagnostics'},
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
        diagnostics = false,
        -- diagnostics = "coc",
        -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --     local icon = level:match("error") and " " or " "
        --     return " " .. icon .. count
        -- end,
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

require('Comment').setup({
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = false,
    toggler = {
        ---Line-comment toggle keymap
        line = '<leader>cc',
        ---Block-comment toggle keymap
        block = '<leader>bc',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = '<leader>c',
        ---Block-comment keymap
        block = '<leader>b',
    },
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
    },
})

require 'nvim-treesitter.configs'.setup{
    ensure_installed = {"cpp", "python"},
    auto_install = true,
    highlight = {
        enable = true,
    }
}

vim.api.nvim_set_hl(0, "@lsp.type.variable", {})
vim.api.nvim_set_hl(0, "@variable", {})
vim.api.nvim_set_hl(0, "PMenu", {})

require("mason").setup()
require("mason-lspconfig").setup{
    ensure_installed = {"clangd"},
}

local cmp = require'cmp'
cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-s>'] = cmp.mapping.open_docs(4),
      ['<tab>'] = cmp.mapping.select_next_item(),
      ['<s-tab>'] = cmp.mapping.select_prev_item(),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, diag in ipairs({ "Error", "Warn", "Info", "Hint" }) do
    vim.fn.sign_define("DiagnosticSign" .. diag, {
        text = "",
        texthl = "DiagnosticSign" .. diag,
        linehl = "",
        numhl = "DiagnosticSign" .. diag,
    })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '■',
  },
  float = {
      header = false,
      border = 'rounded',
  },
  severity_sort = true,
})

vim.keymap.set('n', '<leader>e', function()
    -- If we find a floating window, close it.
    local found_float = false
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_config(win).relative ~= '' then
            vim.api.nvim_win_close(win, true)
            found_float = true
        end
    end

    if found_float then
        return
    end

    vim.diagnostic.open_float(nil, { focus = false })
end, { desc = 'Toggle Diagnostics' })

local on_attach = function(_, _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
    vim.keymap.set('n', 'gt', builtin.lsp_type_definitions, {})
    vim.keymap.set('n', 'gi', builtin.lsp_implementations, {})
    vim.keymap.set('n', 'gr', builtin.lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local border = {
      {"╭", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╮", "FloatBorder"},
      {"│", "FloatBorder"},
      {"╯", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╰", "FloatBorder"},
      {"│", "FloatBorder"},
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

require("lspconfig").clangd.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}
require("lspconfig").pyright.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}
