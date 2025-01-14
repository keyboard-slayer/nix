{
  programs.nixvim = {
    plugins = {
      nix.enable = true;
      lsp = {
        enable = true;
        keymaps = {
          silent = true;
          diagnostic = {
            # Navigate in diagnostics
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gr = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<F2>" = "rename";
          };
        };

        servers = {
          lua_ls.enable = true;
          nil_ls.enable = true;
          pyright.enable = true;
          pylsp.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
            installRustfmt = true;
          };
        };
      };
    };
  };
}
