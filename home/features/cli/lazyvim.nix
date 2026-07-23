{
  pkgs,
  ...
}:
{
  enable = true;
  installCoreDependencies = true;

  config = {
    options = ''
      vim.opt.guifont = "MesloLGS Nerd Font"
    '';

    keymaps = "";
  };

  extras = {
    lang = {
      json.enable = true;
      markdown.enable = true;
      nix.enable = true;
      rust.enable = true;
      toml.enable = true;
      typescript.enable = true;
    };

    editor = {
      fzf.enable = true;
      harpoon2.enable = true;
      snacks-explorer.enable = true;
      snacks-picker.enable = true;
    };

    coding = {
      blink.enable = true;
      mini-surround.enable = true;
    };

    util = {
      project.enable = true;
    };
  };

  plugins = import ./lazyvim_plugins.nix;

  treesitterParsers = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
    rust
    ron
  ];

  extraPackages = with pkgs; [
    alejandra
    ast-grep
    fd
    ghostscript
    imagemagick
    lua-language-server
    lua51Packages.lua
    lua51Packages.luarocks
    mermaid-cli
    nil
    nixd
    nixfmt
    python3
    ripgrep
    shfmt
    silicon
    stylua
    tectonic
    trash-cli
    tree-sitter
    vivify
    xdg-utils
  ];
}
