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

    extraConfigLua = ''
      -- NOTE: If you find those lines stupid, try to comment it and edit a file for the cwd:
      --       > nvim ./flake.nix
      --       Does the line number works ?
      --       Y: Remove those lines
      --       N: Keep it
      vim.o.number = true
      vim.o.relativenumber = true
    '';

    plugins.lazy = {
      enable = true;
    };
  };
}
