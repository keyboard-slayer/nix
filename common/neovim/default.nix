{ config, pkgs, ... }:
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
    extraFiles = {
      "plugin/config.lua".text = ''
        local old_stdpath = vim.fn.stdpath
        vim.fn.stdpath = function(value)
          if value == "config" then
            return "${
              if pkgs.system == "x86_64-linux" then config.home.homeDirectory else config.users.users.keyb.home
            }/nix/common/neovim"
          end
            return old_stdpath(value)
        end
      '';
    };

    plugins.lazy = {
      enable = true;
    };
  };
}
