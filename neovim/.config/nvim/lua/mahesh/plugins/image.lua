-- kitty, [tmux](https://github.com/3rd/image.nvim?tab=readme-ov-file#tmux), curl
-- sudo apt install libmagickwand-dev # [magic_rock](https://github.com/3rd/image.nvim?tab=readme-ov-file#imagemagick)
return {
  {
    "3rd/image.nvim",
    config = function()
      require("image").setup({
        backend = "kitty",
        processor = "magick_rock", -- or "magick_cli"
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = true,
            floating_windows = true, -- if true, images will be rendered in floating markdown windows
            filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
          },
        },
      })
    end,
  },
  --{
  -- NOT using this plugin as rendered diagram is too small and height, width, scale variables here are not working
  --  -- https://github.com/3rd/diagram.nvim?tab=readme-ov-file#integrations--renderers
  --  -- npm install -g @mermaid-js/mermaid-cli
  --  "3rd/diagram.nvim",
  --  dependencies = {
  --    "3rd/image.nvim",
  --  },
  --  opts = { -- you can just pass {}, defaults below
  --    renderer_options = {
  --      mermaid = {
  --        background = 'transparent', -- nil | "transparent" | "white" | "#hex"
  --        theme = 'dark', -- nil | "default" | "dark" | "forest" | "neutral"
  --        scale = 2, -- nil | 1 (default) | 2  | 3 | ...
  --        width = 1000, -- nil | 800 | 400 | ...
  --        height = 1000, -- nil | 600 | 300 | ...
  --      }
  --    }
  --  },
  --  config = function()
  --    require("diagram").setup({
  --      integrations = {
  --        require("diagram.integrations.markdown"),
  --      },
  --      renderer_options = {
  --        mermaid = {
  --          --theme = "forest",
  --        theme = 'white', -- nil | "default" | "dark" | "forest" | "neutral"
  --          scale = 5,
  --          width = 1000,
  --        height = 1000, -- nil | 600 | 300 | ...
  --        },
  --      },
  --    })
  --  end,
  --},
}
