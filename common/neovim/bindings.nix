{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
      have_nerd_font = true;
    };

    keymaps = [
      {
        action = ":Oil<CR>";
        key = "-";
        options = {
          silent = true;
          noremap = true;
        };
      }
      {
        action = "\"+y";
        key = "<leader>y";
        mode = [
          "n"
          "v"
        ];
      }
      {
        action = "\"+p";
        key = "<leader>p";
        mode = [
          "n"
          "v"
        ];
      }
    ];
  };
}
