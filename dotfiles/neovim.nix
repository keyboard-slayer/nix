{ inputs, ... }:
{
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf = {
    enable = true;
    settings.vim = {
      viAlias = false;
      vimAlias = true;

      globals = {
        mapleader = " ";
        maplocalleader = " ";
        have_nerd_font = true;
      };

      options = {
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
        splitbelow = true;
        inccommand = "nosplit";
        cursorline = true;
        scrolloff = 10;
        tabstop = 4;
        expandtab = true;
        softtabstop = 4;
        shiftwidth = 4;
        laststatus = 3;
      };

      keymaps = [
        {
          mode = "n";
          key = "<Esc>";
          action = "<cmd>nohlsearch<CR>";
        }
        {
          mode = "n";
          key = "<C-h>";
          action = "<C-w><C-h>";
        }
        {
          mode = "n";
          key = "<C-j>";
          action = "<C-w><C-j>";
        }
        {
          mode = "n";
          key = "<C-k>";
          action = "<C-w><C-k>";
        }
        {
          mode = "n";
          key = "<C-l>";
          action = "<C-w><C-l>";
        }
        {
          mode = [
            "n"
            "v"
          ];
          key = "gh";
          action = "g0";
        }
        {
          mode = [
            "n"
            "v"
          ];
          key = "gl";
          action = "$";
        }
        {
          mode = "n";
          key = "-";
          action = "<cmd>Oil<CR>";
        }
        {
          mode = [
            "n"
            "v"
          ];
          key = "<leader>y";
          action = "\"+y";
        }
        {
          mode = [
            "n"
            "v"
          ];
          key = "<leader>p";
          action = "\"+p";
        }
      ];

      autocmds = [ ];

      theme = {
        enable = true;
        transparent = true;
        name = "catppuccin";
        style = "mocha";
      };

      mini.icons.enable = true;
      autopairs.nvim-autopairs.enable = true;
      autocomplete.blink-cmp = {
        enable = true;
        setupOpts.cmdline.keymap.preset = "super-tab";
      };

      telescope = {
        enable = true;
        mappings = {
          buffers = "<leader><leader>";
          diagnostics = "<leader>fd";
          lspDefinitions = "<leader>gd";
          lspReferences = "<leader>gr";
          lspImplementations = "<leader>gi";
        };
      };

      utility = {
        motion.flash-nvim.enable = true;
        oil-nvim = {
          enable = true;
          setupOpts.view_options.show_hidden = true;
        };
      };

      statusline.lualine.enable = true;
      formatter.conform-nvim = {
        enable = true;
      };

      lsp = {
        otter-nvim.enable = true;
        enable = true;
        inlayHints.enable = true;
        formatOnSave = true;
      };

      treesitter = {
        enable = true;
        highlight.enable = true;
        indent.enable = true;
        fold = false;
        incrementalSelection.enable = true;
      };

      languages = {
        nix = {
          enable = true;
          treesitter.enable = true;
          format = {
            enable = true;
            type = "nixfmt";
          };
        };
      };

      luaConfigRC.flash = ''
        require('flash').toggle() 
      '';
    };
  };
}
