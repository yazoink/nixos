{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    bundles.base.nvim.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.base.nvim.enable {
    stylix.targets.nvf = {
      enable = true;
    };
    programs.nvf = {
      enable = true;
      settings.vim = {
        # Plugins
        telescope.enable = true;
        mini.statusline.enable = true;
        autopairs.nvim-autopairs.enable = true;

        session = {
          nvim-session-manager.enable = false;
        };

        gestures = {
          gesture-nvim.enable = false;
        };

        comments = {
          comment-nvim.enable = true;
        };

        spellcheck = {
          enable = true;
        };

        filetree = {
          neo-tree = {
            enable = true;
          };
        };

        tabline = {
          nvimBufferline.enable = true;
        };

        treesitter.context.enable = true;

        git = {
          enable = true;
          gitsigns.enable = true;
          gitsigns.codeActions.enable = false; # throws an annoying debug message
        };

        terminal = {
          toggleterm = {
            enable = true;
            lazygit.enable = true;
          };
        };

        autocomplete = {
          nvim-cmp.enable = true;
        };

        # LSP
        lsp = {
          # This must be enabled for the language modules to hook into
          # the LSP API.
          enable = true;

          formatOnSave = true;
          lspkind.enable = false;
          lightbulb.enable = true;
          lspsaga.enable = false;
          trouble.enable = true;
        };

        # Languages
        languages = {
          enableTreesitter = true;
          enableFormat = true;

          nix.enable = true;
          ts.enable = true;
          rust.enable = true;
          sql.enable = true;
          clang.enable = true;
          python.enable = true;
          markdown.enable = true;
          php.enable = true;
          lua.enable = true;
          go.enable = true;
          bash.enable = true;
          css.enable = true;
          html.enable = true;
        };

        # Snippets
        snippets.luasnip.enable = true;

        # UI
        visuals = {
          nvim-scrollbar.enable = true;
          nvim-web-devicons.enable = true;
          nvim-cursorline.enable = true;
          cinnamon-nvim.enable = true;
          fidget-nvim.enable = true;
          highlight-undo.enable = true;
          indent-blankline.enable = true;
        };

        ui = {
          borders.enable = true;
          noice.enable = true;
          colorizer.enable = true;
          modes-nvim.enable = false; # the theme looks terrible with catppuccin
          illuminate.enable = true;
          smartcolumn = {
            enable = true;
            setupOpts.custom_colorcolumn = {
              # this is a freeform module, it's `buftype = int;` for configuring column position
              nix = "110";
              ruby = "120";
              java = "130";
              go = ["90" "130"];
            };
          };
          fastaction.enable = true;
        };
      };
    };
  };
}
