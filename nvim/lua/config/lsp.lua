-- LSP Config with lspconfig + mason
local lspconfig = require('lspconfig')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local signature = require('lsp_signature')

-- Configuración de Mason y mason-lspconfig
mason.setup()
mason_lspconfig.setup({
    ensure_installed = { "rust_analyzer" }
})

-- Configurar lsp_signature
signature.setup({
    bind = true, -- Esto asegura que la firma esté ligada al buffer actual
    hint_enable = true, -- Mostrar sugerencias de firmas de funciones
    floating_window = true, -- Ventana flotante para mostrar la información
    handler_opts = {
        border = "rounded",
    },
    extra_trigger_chars = { "(", "," }, -- Mostrar la firma cuando escribas estos caracteres
	auto_close_after = 0.3,
	toggle_key = '<C-C>',
})

-- Configurar servidores LSP usando mason-lspconfig
mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup {
            on_attach = function(client, bufnr)
                -- Activa lsp_signature cuando se conecta el LSP
                signature.on_attach({
                    bind = true,
                    hint_enable = true,
                    floating_window = true,
                    handler_opts = { border = "rounded" },
                }, bufnr)
            end
        }
    end,
})

