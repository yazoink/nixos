{colors, ...}: let
  gtkrcFile = colors {
    template = ./gtkrc.mustache;
    extension = ".css";
  };
in {
  home.sessionVariables = {
    GTK_CSD = 0;
  };
  gtk = {
    enable = true;
    gtk2 = {
      extraConfig = builtins.readFile gtkrcFile;
    };
    # gtk4.theme = config.gtk.theme; # might cause issues?
    # gtk3 = {
    #   extraConfig = {
    #     gtk-decoration-layout = "menu";
    #   };
    # };
    # gtk4 = {
    #   extraConfig = {
    #     gtk-decoration-layout = "menu";
    #   };
    # };
  };
  stylix = {
    targets.gtk = {
      extraCss = with colors; ''
        @define-color headerbar_bg_color #${base00};
        @define-color dialog_bg_color #${base00};
        @define-color popover_bg_color #${base00};
        @define-color sidebar_bg_color #${base00};
        @define-color accent_color #${base0D};
        @define-color accent_bg_color #${base0D};

         /* No (default) title bar on wayland */
        headerbar.default-decoration {
          /* You may need to tweak these values depending on your GTK theme */
          border-radius: 0;
          border: 0;
          box-shadow: none;
          font-size: 0;
          margin-bottom: 50px;
          margin-top: -100px;
          min-height: 0;
          padding: 0;
        }

        .titlebar,
        .titlebar .background
        {
          border-radius: 0;
        }

        /* rm -rf window shadows */
        window.csd,             /* gtk4? */
        window.csd decoration { /* gtk3 */
          border-radius: 0;
          box-shadow: none;
        }

        .dialog-action-area > .text-button {
          color: @dialog_fg_color;
        }
      '';
    };
  };
}
