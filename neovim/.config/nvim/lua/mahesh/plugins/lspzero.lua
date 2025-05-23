-- copied from docs: https://lsp-zero.netlify.app/v3.x/guide/lazy-loading-with-lazy-nvim.html
-- :LspInfo  check active LSPs for current file
-- :Mason to manage language servers
-- :messages to check logs
-- :checkhealth mason
-- Ctrl+n to view all suggestions - such as available attributes on a react component
return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
    
    -- get path where mason is installing packages: 
    --    :lua print(require("mason-core.path").install_prefix())
    -- :Mason shows list of Installed/Available packages by Mason
    -- https://github.com/williamboman/mason.nvim?tab=readme-ov-file#default-configuration
    -- In Mason list: i - install, u - update, X - uninstall

    -- https://mason-registry.dev/registry/list
    -- Mason installs - 1.LSP(Language servers - provide list of functions/variables available on current variable)
    -- 2.DAP(debuggers)   3.Linter(Show warnings/errors in syntax)   4.Formatter(rearrange code make is more readable)
  },
  {
    -- you can replace this package with just a script which run on start
    -- vim.api.nvim_create_user_command("MasonInstallAll", function()          
   --     local packages = table.concat(opts.ensure_installed, " ")
   --     vim.cmd("MasonInstall " .. packages )     
   --end, {})
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
      require('mason-tool-installer').setup {
        -- sql-formatter is npm package, no longer needed as it does not format sql as i want it to
        -- ensure_installed = { "sql-formatter" },
      }
    end,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      { 'L3MON4D3/LuaSnip' },
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup({
        formatting = lsp_zero.cmp_format({ details = true }),
        mapping = cmp.mapping.preset.insert({
          -- default: C-p = previus, C-n = next, C-y = confirm/select
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      })
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      --- if you want to know more about lsp-zero and mason.nvim
      --- read this: https://github.c:LspZeroFormatom/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })

        -- https://lsp-zero.netlify.app/v3.x/language-server-configuration.html#creating-new-keybindings
        -- https://lsp-zero.netlify.app/v3.x/language-server-configuration.html#how-does-it-work
        local opts = { buffer = bufnr }
        -- 	vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts) -- default
        --vim.keymap.set('n', '<leader>li', '<cmd>lua vim.lsp.buf.hover()<cr>', opts) -- li=lsp info
        -- 	vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts) -- default
        vim.keymap.set('n', 'gd', '<cmd>tab split | lua vim.lsp.buf.definition()<cr>', opts) -- open definition in new tab
        --  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts) -- default
        --  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts) -- default
        --  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts) -- default
        --  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts) -- default
        --  no lr, as 'l' is used to move right
        vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<cr>', opts) -- lr=lsp reference
        --  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts) -- default
        --  vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)  -- default
        --  vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)  -- default
        --  vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts) -- default
        vim.keymap.set('n', '<leader>ll', '<cmd>lua vim.diagnostic.open_float()<cr>', opts) -- default
        --  vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts) -- default
        --  vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts) -- default

        -- https://neovim.io/doc/user/lsp.html#vim.lsp.buf.format()
        -- formatting using lsp-server
        --vim.keymap.set({ 'n', 'x' }, '<leader>fm', function()
        --  vim.lsp.buf.format({ async = false, timeout_ms = 10000, formatting_options = { tabSize = 2, insertSpaces = true } })
        --end, opts)
      end)

      require('mason-lspconfig').setup({
        -- available servers: https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
        -- list of available servers ->    :Mason  -> 2)LSP (alt+2) -> search name (`/typescript`)
        -- marksman
        --    does not support formatting
        -- sqlls
        --    not using as it is giving more wrong syntax errors than helping with syntax, may need configuration, but i don't have time
        --    need to create `.sqllsrc.json` file at the root of your project (https://github.com/joe-re/sql-language-server?tab=readme-ov-file#configuration)
        --      content can be empty json: {}
        ensure_installed = { "lua_ls", "tsserver", "cssls", "tailwindcss", "prismals", "clangd", "solidity_ls_nomicfoundation", "marksman" },
        -- not needed for now:  "gopls"
        handlers = {
          -- this first function is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,

          -- this is the "custom handler" for `lua_ls`
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,

          -- this is the "custom handler" for `tsserver`
          tsserver = function()
            -- (Optional) Configure ts_ls for neovim
            --    https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ts_ls
            -- if you use `setup()` instead of `setup({})`, it will give error: attempt to index local 'user_config' (a nil value)
            require('lspconfig').ts_ls.setup({
              filetypes = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' }
            })
          end,

          tailwindcss = function()
            require('lspconfig').tailwindcss.setup({
              filetypes = { 'typescriptreact', 'javascriptreact' }
            })
          end,
        }
      })
    end
  }
}
