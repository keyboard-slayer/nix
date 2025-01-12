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
    ];
  };
}
