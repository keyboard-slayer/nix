{
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>fh" = "help_tags";
      "<leader>fk" = "keymaps";
      "<leader>ff" = "find_files";
      "<leader>fg" = "live_grep";
      "<leader>fd" = "diagnostics";
      "<leader><leader>" = "buffers";
    };
  };
}
