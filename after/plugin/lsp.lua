
local on_attach = function(_, bufnr)

  local keymap = function(keys, func)
    vim.keymap.set('n', keys, func, { buffer = bufnr })
  end

  keymap('<leader>r', vim.lsp.buf.rename)
  keymap('<leader>a', vim.lsp.buf.code_action)

  keymap('gd', vim.lsp.buf.definition)
  keymap('gD', vim.lsp.buf.declaration)
  keymap('gI', vim.lsp.buf.implementation)
  keymap('<leader>D', vim.lsp.buf.type_definition)

  keymap('gr', require('telescope.builtin').lsp_references)
  keymap('<leader>s', require('telescope.builtin').lsp_document_symbols)
  keymap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)

  keymap('K', vim.lsp.buf.hover)

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, {})
end

-- Mason
require("mason").setup()
require("mason-lspconfig").setup_handlers({

    function(server_name)
        require("lspconfig")[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities
        }
    end,

    ["lua_ls"] = function()
        require('neodev').setup()
        require('lspconfig').lua_ls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            }
        }
    end
})