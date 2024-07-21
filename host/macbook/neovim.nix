{ pkgs, inputs, config, ... }: {
  imports = [
    inputs.nixvim.nixDarwinModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    plugins = {
      transparent.enable = true;
    };

    opts = {
      mouse = "a";
      showmode = false;
      helplang="en";
      background = "dark";
      breakindent = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      tabstop = 4;
      timeoutlen = 300;
      splitright = true;
      inccommand = "split";
      cursorline = true;
      splitbelow = true;
      softtabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      number = true;
      smartindent = true;
      autoindent = true;
      wrap = false;
      swapfile = false;
      backup = false;
      undodir = "${config.users.users.keyb.home}/.vim/undo";
      undofile = true;
      hlsearch = false;
      incsearch = true;
      guicursor = "";
    };

    extraConfigLua = ''
      vim.api.nvim_create_autocmd("FileType", {
	      pattern = "nix",
	      command = "setlocal shiftwidth=2 tabstop=2"
      })
    '';
  };
}
