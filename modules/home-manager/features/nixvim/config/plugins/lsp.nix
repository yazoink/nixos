{
  lspkind = {
    enable = true;
    settings = {
      maxwidth = 50;
      ellipsis_char = "...";
    };
  };
  lsp = {
    enable = true;
    servers = {
      # Average webdev LSPs
      # ts-ls.enable = true; # TS/JS
      racket_langserver.enable = true;
      racket_langserver.package = "null";
      ts_ls.enable = true; # TS/JS
      cssls.enable = true; # CSS
      html.enable = true; # HTML
      phpactor = {
        enable = true;
        autostart = true;
        cmd = ["phpactor" "language-server"];
        filetypes = ["php"];
      };
      pyright.enable = true; # Python
      marksman.enable = true; # Markdown
      # nil_ls.enable = true; # Nix
      nixd.enable = true;
      dockerls.enable = true; # Docker
      bashls.enable = true; # Bash
      clangd.enable = true; # C/C++
      jsonls.enable = true;
      sqls.enable = true;
      zls.enable = true;
      #csharp_ls.enable = true; # C#
      yamlls.enable = true; # YAML
      ltex = {
        enable = true;
        settings = {
          enabled = ["html" "latex" "markdown" "text" "tex" "gitcommit"];
          completionEnabled = true;
          language = "en-US";
        };
      };
      gopls = {
        # Golang
        enable = true;
        autostart = true;
      };

      lua_ls = {
        # Lua
        enable = true;
        settings.telemetry.enable = false;
      };

      # Rust
      rust_analyzer = {
        enable = true;
        installRustc = true;
        installCargo = true;
      };
    };
  };
}
