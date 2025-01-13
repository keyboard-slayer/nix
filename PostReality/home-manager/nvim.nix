{ config, ... }:
{
  programs.nixvim.extraFiles = {
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
}
