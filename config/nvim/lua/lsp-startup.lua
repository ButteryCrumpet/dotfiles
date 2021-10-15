local nvim_lsp = require('lspconfig')

local saga = require'lspsaga'
saga.init_lsp_saga()

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

-- SERVER SETUP
local servers = { "erlangls", "ocamlls", "rust_analyzer", "intelephense" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capablities = capablities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

nvim_lsp.tsserver.setup {
    capablities = capablities,
    flags = {
      debounce_text_changes = 150,
    },
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
    end
}

-- FORMAT ON SAVE
local format_async = function(err, result, ctx)
    if err ~= nil or result == nil then return end
    if not vim.api.nvim_buf_get_option(ctx.bufnr, "modified") then
        local view = vim.fn.winsaveview()
        vim.lsp.util.apply_text_edits(result, ctx.bufnr)
        vim.fn.winrestview(view)
        if ctx.bufnr == vim.api.nvim_get_current_buf() then
            vim.b.saving_format = true
            vim.api.nvim_command("noautocmd :update")
            vim.b.saving_format = false
        end
    end
end

vim.lsp.handlers["textDocument/formatting"] = format_async

local on_attach = function(client, bufnr)
  vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
  if client.resolved_capabilities.document_formatting then
        vim.api.nvim_exec([[
         augroup LspAutocommands
             autocmd! * <buffer>
             autocmd BufWritePost <buffer> LspFormatting
         augroup END
         ]], true)
    end
  end

-- DIAGNOSTICS 
local filetypes = {
    typescript = "eslint",
    typescriptreact = "eslint",
}

local linters = {
    eslint = {
        sourceName = "eslint",
        command = "eslint_d",
        rootPatterns = {".eslintrc.js", "package.json"},
        debounce = 100,
        args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
        parseJson = {
            errorsRoot = "[0].messages",
            line = "line",
            column = "column",
            endLine = "endLine",
            endColumn = "endColumn",
            message = "${message} [${ruleId}]",
            security = "severity"
        },
        securities = {[2] = "error", [1] = "warning"}
    }
}

local formatters = {
    prettier = {command = "prettier", args = {"--stdin-filepath", "%filepath"}}
}

local formatFiletypes = {
    typescript = "prettier",
    typescriptreact = "prettier"
}

nvim_lsp.diagnosticls.setup {
    on_attach = on_attach,
    filetypes = vim.tbl_keys(filetypes),
    init_options = {
        filetypes = filetypes,
        linters = linters,
        formatters = formatters,
        formatFiletypes = formatFiletypes
    }
}
