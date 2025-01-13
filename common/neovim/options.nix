{
  programs.nixvim = {
    autoGroups.yankhighlight.clear = true;
    autoCmd = [
      {
        callback.__raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';

        group = "yankhighlight";
        pattern = "*";

        event = [
          "TextYankPost"
        ];
      }
    ];
    globalOpts = {
      guicursor = "";
      number = true;
      relativenumber = true;
      mouse = "a";
      showmode = false;
      breakindent = true;
      undofile = true;
      swapfile = false;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      updatetime = 250;
      timeoutlen = 300;
      splitright = true;
      splitbelow = false;
      list = true;
      inccommand = "nosplit";
      cursorline = true;
      scrolloff = 10;
      tabstop = 4;
      expandtab = true;
      softtabstop = 4;
      shiftwidth = 4;
      laststatus = 3;
    };
  };
}
