{ config, ... }:
{
  imports = [
    ./oil.nix
    ./mini.nix
    ./bindings.nix
    ./lsp.nix
    ./conform.nix
    ./catppuccin.nix
    ./lualine.nix
    ./options.nix
    ./snacks.nix
    ./telescope.nix
    ./treesitter.nix
    ./term.nix
    ./lazydev.nix
    ./cmp.nix
    ./git-search.nix
  ];

  programs.nixvim = {
    enable = true;

    plugins.lazy = {
      enable = true;
    };

    extraFiles = {
      "plugin/config.lua".text = ''
        local old_stdpath = vim.fn.stdpath
        vim.fn.stdpath = function(value)
          if value == "config" then
            return "${config.home.homeDirectory}/nix/common/neovim"
          end
            return old_stdpath(value)
        end
      '';
    };
  };
}
