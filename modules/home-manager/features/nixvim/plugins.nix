{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.bundles.base.nixvim.enable {
    home.packages = with pkgs; [
      prettierd
      black
      stylua
      alejandra
      shfmt
      beautysh
      yamllint
      yamlfmt
      uncrustify
      fixjson
      rustfmt
      php84Packages.php-cs-fixer
    ];
    programs.nixvim = {
      plugins = {
        lualine = {
          enable = true;
          settings = {
            alwaysDivideMiddle = true;
            ignoreFocus = ["neo-tree"];
            globalstatus = true;
            options = {
              icons_enabled = false;
              section_separators = {
                left = "";
                right = "";
              };
              component_separators = {
                left = "";
                right = "";
              };
              theme = "auto";
            };
          };
        };

        floaterm = {
          enable = true;
          settings = {
            width = 0.8;
            height = 0.8;
            title = "bababooey";
            keymap_toggle = "<leader>tt";
            titleposition = "center";
          };
        };

        ts-autotag.enable = true;
        persistence.enable = true;

        gitsigns = {
          enable = true;
          settings = {
            current_line_blame = true;
            signs = {
              add = {text = "+";};
              change = {text = "~";};
              delete = {text = "_";};
              topdelete = {text = "‾";};
              changedelete = {text = "~";};
            };
          };
        };

        mini = {
          enable = true;
          mockDevIcons = true;
          modules = {
            icons = {
              style = "glyph";
            };
            pairs = {
              modes = {
                insert = true;
                command = false;
                terminal = false;
              };
            };
            # tabline = {
            #   show_icons = false;
            # };
            comment = {
              mappings = {
                comment = "gc";
                comment_line = "gcc";
                comment_visual = "gc";
              };
            };
            # basics = {};
            hipatterns = {};
            clue = {};
          };
        };

        /*
          barbar.enable = true;
        dressing = {
          enable = true;
          settings = {
            input = {
              enabled = true;
              mappings = {
                i = {
                  "<C-c>" = "Close";
                  "<CR>" = "Confirm";
                  "<Down>" = "HistoryNext";
                  "<Up>" = "HistoryPrev";
                };
                n = {
                  "<CR>" = "Confirm";
                  "<Esc>" = "Close";
                };
              };
            };
            select = {
              backend = [
                "telescope"
                "fzf_lua"
                "fzf"
                "builtin"
                "nui"
              ];
              builtin = {
                mappings = {
                  "<C-c>" = "Close";
                  "<CR>" = "Confirm";
                  "<Esc>" = "Close";
                };
              };
              enabled = true;
            };
          };
        };
        */

        alpha = {
          enable = true;
          theme = "dashboard";
        };

        nix = {
          enable = true;
        };

        neo-tree = {
          enable = true;
          enableDiagnostics = true;
          enableGitStatus = true;
          enableModifiedMarkers = true;
          enableRefreshOnWrite = true;
          closeIfLastWindow = true;
          popupBorderStyle = "single"; # Type: null or one of “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code
          buffers = {
            bindToCwd = false;
            followCurrentFile = {
              enabled = true;
            };
          };
          extraOptions = {
            filesystem = {
              filtered_items = {
                visible = true;
              };
            };
          };
          window = {
            width = 40;
            height = 15;
            autoExpandWidth = false;
            #mappings = {
            #  "<space>" = "none";
            #};
          };
        };

        /*
          undotree = {
          enable = true;
          settings = {
            autoOpenDiff = true;
            focusOnToggle = true;
          };
        };
        */

        zig.enable = true;

        neoscroll.enable = true;

        /*
          telescope = {
          enable = true;
          extensions = {
            fzf-native = {
              enable = true;
            };
          };
        };
        */

        illuminate = {
          enable = true;
          underCursor = false;
          filetypesDenylist = [
            "Outline"
            "TelescopePrompt"
            "alpha"
            "harpoon"
            "reason"
          ];
        };

        /*
        noice = {
        enable = true;
        settings = {
          notify = {
            enabled = true;
          };
          messages = {
            enabled = true; # Adds a padding-bottom to neovim statusline when set to false for some reason
          };
          lsp = {
            message = {
              enabled = false;
            };
            progress = {
              enabled = false;
              view = "mini";
            };
          };
          popupmenu = {
            enabled = true;
            backend = "nui";
          };
          format = {
            filter = {
              pattern = [":%s*%%s*s:%s*" ":%s*%%s*s!%s*" ":%s*%%s*s/%s*" "%s*s:%s*" ":%s*s!%s*" ":%s*s/%s*"];
              icon = "";
              lang = "regex";
            };
            replace = {
        */
        #pattern = [":%s*%%s*s:%w*:%s*" ":%s*%%s*s!%w*!%s*" ":%s*%%s*s/%w*/%s*" "%s*s:%w*:%s*" ":%s*s!%w*!%s*" ":%s*s/%w*/%s*"];
        /*
                  icon = "󱞪";
                lang = "regex";
              };
            };
          };
        };
        */

        #web-devicons.enable = true;
        #barbecue.enable = true;
        scrollview.enable = true;

        treesitter = {
          enable = true;
          nixvimInjections = true;
          folding = false;
          nixGrammars = true;
          settings = {
            ensure_installed = "all";
            highlight.enable = true;
            incremental_selection.enable = true;
            indent.enable = true;
          };
        };

        treesitter-refactor = {
          enable = true;
        };

        colorizer = {
          enable = true;
        };

        indent-blankline.enable = true;

        conform-nvim = {
          enable = true;
          settings = {
            format_on_save = {
              lspFallback = true;
              timeoutMs = 500;
            };
            notify_on_error = true;
            formatters_by_ft = {
              html = ["prettierd" "prettier"];
              css = ["prettierd" "prettier"];
              javascript = ["prettierd" "prettier"];
              typescript = ["prettierd" "prettier"];
              markdown = ["prettierd" "prettier"];
              python = ["black"];
              lua = ["stylua"];
              nix = ["alejandra"];
              bash = ["shfmt" "beautysh"];
              sh = ["shellcheck" "beautysh"];
              yaml = ["yamllint" "yamlfmt"];
              c = ["uncrustify"];
              json = ["fixjson"];
              php = ["php_cs_fixer"];
              rust = ["rustfmt"];
              # zig = ["zigfmt"];
              # latex = ["llf"];
            };
          };
        };

        # none-ls = {
        #   enable = true;
        #   enableLspFormat = true;
        #   sources = {
        #     code_actions = {
        #       statix.enable = true;
        #       gitsigns.enable = true;
        #     };
        #     diagnostics = {
        #       statix.enable = true;
        #       deadnix.enable = true;
        #       #pylint.enable = true; this thing is just annoying
        #       checkstyle.enable = true;
        #       yamllint.enable = true;
        #     };
        #     formatting = {
        #       alejandra.enable = true;
        #       stylua.enable = true;
        #       shfmt.enable = true;
        #       nixpkgs_fmt.enable = true;
        #       google_java_format.enable = false;
        #       yamlfmt.enable = true;
        #       prettier = {
        #         enable = true;
        #         disableTsServerFormatter = true;
        #       };
        #       black = {
        #         enable = true;
        #         settings = ''
        #           {
        #             extra_args = { "--fast" },
        #           }
        #         '';
        #       };
        #     };
        #     completion = {
        #       luasnip.enable = true;
        #       spell.enable = true;
        #     };
        #   };
        # };

        luasnip.enable = true;

        cmp = {
          enable = true;
          settings = {
            autoEnableSources = true;
            experimental = {ghost_text = true;};
            performance = {
              debounce = 60;
              fetchingTimeout = 200;
              maxViewEntries = 30;
            };
            snippet = {expand = "luasnip";};
            formatting = {fields = ["kind" "abbr" "menu"];};
            sources = [
              {name = "nvim_lsp";}
              #{ name = "emoji"; }
              {
                name = "buffer"; # text within current buffer
                option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
                keywordLength = 3;
              }
              {
                name = "path"; # file system paths
                keywordLength = 3;
              }
              {
                name = "luasnip"; # snippets
                keywordLength = 3;
              }
            ];

            window = {
              completion = {border = "solid";};
              documentation = {border = "solid";};
            };

            mapping = {
              "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
              "<C-j>" = "cmp.mapping.select_next_item()";
              "<C-k>" = "cmp.mapping.select_prev_item()";
              "<C-Down>" = "cmp.mapping.select_next_item()";
              "<C-Up>" = "cmp.mapping.select_prev_item()";
              "<C-e>" = "cmp.mapping.abort()";
              #"<C-b>" = "cmp.mapping.scroll_docs(-4)";
              #"<C-f>" = "cmp.mapping.scroll_docs(4)";
              # "<C-Space>" = "cmp.mapping.complete()";
              "<C-Space>" = "cmp.mapping.confirm({ select = true })";
              # "<Tab>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
            };
          };
        };

        cmp-nvim-lsp = {
          enable = true; # LSP
        };
        cmp-buffer = {
          enable = true;
        };
        cmp-path = {
          enable = true; # file system paths
        };
        cmp_luasnip = {
          enable = true; # snippets
        };

        lspkind = {
          enable = true;
          symbolMap = {
            Copilot = "";
          };
          extraOptions = {
            maxwidth = 50;
            ellipsis_char = "...";
          };
        };

        /*
          nvim-autopairs = {
          enable = true;
          settings = {
            check_ts = true;
          };
        };
        */

        /*
          fidget = {
          enable = true;
          logger = {
            level = "warn"; # “off”, “error”, “warn”, “info”, “debug”, “trace”
            floatPrecision = 0.01; # Limit the number of decimals displayed for floats
          };
          progress = {
            pollRate = 0; # How and when to poll for progress messages
            suppressOnInsert = true; # Suppress new messages while in insert mode
            ignoreDoneAlready = false; # Ignore new tasks that are already complete
            ignoreEmptyMessage = false; # Ignore new tasks that don't contain a message
            clearOnDetach =
              # Clear notification group when LSP server detaches
              ''
                function(client_id)
                  local client = vim.lsp.get_client_by_id(client_id)
                  return client and client.name or nil
                end
              '';
            notificationGroup =
              # How to get a progress message's notification group key
              ''
                function(msg) return msg.lsp_client.name end
              '';
            ignore = [ ]; # List of LSP servers to ignore
            lsp = {
              progressRingbufSize = 0; # Configure the nvim's LSP progress ring buffer size
            };
            display = {
              renderLimit = 16; # How many LSP messages to show at once
              doneTtl = 3; # How long a message should persist after completion
              doneIcon = "✔"; # Icon shown when all LSP progress tasks are complete
              doneStyle = "Constant"; # Highlight group for completed LSP tasks
              progressTtl = "math.huge"; # How long a message should persist when in progress
              progressIcon = {
                pattern = "dots";
                period = 1;
              }; # Icon shown when LSP progress tasks are in progress
              progressStyle = "WarningMsg"; # Highlight group for in-progress LSP tasks
              groupStyle = "Title"; # Highlight group for group name (LSP server name)
              iconStyle = "Question"; # Highlight group for group icons
              priority = 30; # Ordering priority for LSP notification group
              skipHistory = true; # Whether progress notifications should be omitted from history
              formatMessage = ''
                require ("fidget.progress.display").default_format_message
              ''; # How to format a progress message
              formatAnnote = ''
                function (msg) return msg.title end
              ''; # How to format a progress annotation
              formatGroupName = ''
                function (group) return tostring (group) end
              ''; # How to format a progress notification group's name
              overrides = {
                rust_analyzer = {
                  name = "rust-analyzer";
                };
              }; # Override options from the default notification config
            };
          };
          notification = {
            pollRate = 10; # How frequently to update and render notifications
            filter = "info"; # “off”, “error”, “warn”, “info”, “debug”, “trace”
            historySize = 128; # Number of removed messages to retain in history
            overrideVimNotify = true;
            redirect = ''
              function(msg, level, opts)
                if opts and opts.on_open then
                  return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
                end
              end
            '';
            configs = {
              default = "require('fidget.notification').default_config";
            };

            window = {
              normalHl = "Comment";
              winblend = 0;
              border = "none"; # none, single, double, rounded, solid, shadow
              zindex = 45;
              maxWidth = 0;
              maxHeight = 0;
              xPadding = 1;
              yPadding = 0;
              align = "bottom";
              relative = "editor";
            };
            view = {
              stackUpwards = true; # Display notification items from bottom to top
              iconSeparator = " "; # Separator between group name and icon
              groupSeparator = "---"; # Separator between notification groups
              groupSeparatorHl =
                # Highlight group used for group separator
                "Comment";
            };
          };
        };
        */

        lsp = {
          enable = true;
          servers = {
            # Average webdev LSPs
            # ts-ls.enable = true; # TS/JS
            ts_ls.enable = true; # TS/JS
            cssls.enable = true; # CSS
            html.enable = true; # HTML
            phpactor.enable = true; # PHP
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
      };
    };
  };
}
