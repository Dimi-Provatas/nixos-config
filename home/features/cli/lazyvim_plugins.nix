{
  colorscheme = ''
    return {
      {
        "folke/tokyonight.nvim",
        opts = {
          transparent = true,
          styles = {
            sidebars = "transparent",
            floats = "transparent",
          },
        },
      },
      {
        "LazyVim/LazyVim",
        opts = {
          colorscheme = "tokyonight",
        },
      },
    }
  '';

  silicon = ''
    require("which-key").add({
        mode = { "v" },
        { "<leader>s",  group = "Silicon" },
        { "<leader>sc", function() require("nvim-silicon").clip() end, desc = "Copy code screenshot to clipboard" },
        { "<leader>sf", function() require("nvim-silicon").file() end,  desc = "Save code screenshot as file" },
    })
    return {
      "michaelrommel/nvim-silicon",
      lazy = true,
      main = "nvim-silicon",
      cmd = "Silicon",
      opts = {
        font = "MesloLGS Nerd Font=18;Noto Color Emoji",
        background = "#8a2be2",
        output = function ()
          return "~/Pictures/Code/" .. os.date("%Y%m%d_%H%M%S" .. ".png")
        end,
        language = function()
          return vim.bo.filetype
        end,
      },
    }
  '';

  # Markdown preview
  vivify = ''
    require("which-key").add({
        mode = { "n" },
        { "<leader>cp", "<cmd>Vivify<cr>",  desc = "Open Markdown preview in browser" },
    })
    return { "jannis-baum/vivify.vim" }
  '';

  snacks = ''
    return {
      {
        "folke/snacks.nvim",
        opts = {
          picker = {
            sources = {
              files = {
                hidden = true,
                ignored = false,
              },
              grep = {
                hidden = true,
                ignored = false,
              },
              explorer = {
                hidden = true,
                ignored = true,
                exclude = { "node_modules", ".git", "target" },
              },
            },
          },
        },
      },
    }
  '';

  lualine = ''
    return {
      "nvim-lualine/lualine.nvim",
      event = "VeryLazy",
      opts = function(_, opts)
        opts.sections.lualine_c[4] = { LazyVim.lualine.pretty_path({
          length = 6,
        }) }
      end,
    }
  '';

  arduino = ''
    return {
      "yuukiflow/Arduino-Nvim",
      ft = "arduino",
      opts = {
        config_file = ".arduino_config.lua",
        board = "arduino:avr:nano",
        port = "/dev/ttyUSB0",
        baudrate = 9600,
        use_default_keymaps = true,
        use_default_commands = true,
        keymaps = {},
        picker_backend = "telescope",
      },
      dependencies = {
        "nvim-telescope/telescope.nvim",
        "neovim/nvim-lspconfig",
      },
    }
  '';
}
