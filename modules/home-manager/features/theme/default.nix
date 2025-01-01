# depends on system theme module
{osConfig, pkgs, lib, config, ...}:
let
  gtkrcFile = config.lib.stylix.colors {
    template = ./gtkrc.mustache;
    extension = ".css";
  };
  kvantumGenerator = ./kvantum-generator/generate_kvantum.py;
  oneUiIcons = pkgs.callPackage ./oneui4-icons.nix {};
in
{
  imports = [./themes];
  config = lib.mkIf osConfig.myOptions.bundles.desktopBase.enable {
    systemd.user.services.generate-kvantum = {
      Unit.Description = "Generate the Kvantum theme";
      Service = {
        Type = "oneshot";
        ExecStart = with config.stylix.base16Scheme; "${pkgs.python3}/bin/python3 ${kvantumGenerator} ${base00} ${base05} ${base06} ${base03} ${config.stylix.base16Scheme.${osConfig.desktopTheme.base16Accent}} ${./kvantum-generator/KvRecolor} /home/${osConfig.myOptions.userAccount.username}/.config/Kvantum/KvLibadwaitaRecolor";
      };
      Install = {
        WantedBy = ["default.target"];
      };
    };
    stylix = {
      /*iconTheme = {
        enable = true;
        dark = "Papirus-Dark";
        light = "Papirus";
        package = pkgs.papirus-icon-theme.override {color = "adwaita";};
      };*/
      targets = {
        waybar.enable = false;
        gtk.extraCss = with config.stylix.base16Scheme; ''
          @define-color headerbar_bg_color #${base00};
          @define-color dialog_bg_color #${base00};
          @define-color popover_bg_color #${base00};
          @define-color sidebar_bg_color #${base00};
          @define-color accent_color #${config.stylix.base16Scheme.${osConfig.desktopTheme.base16Accent}};
          @define-color accent_bg_color #${config.stylix.base16Scheme.${osConfig.desktopTheme.base16Accent}};

          .window-frame, .window-frame:backdrop {
            border-style: solid;
            border-width: 1px;
            border-color: ${base01};
            margin: 0;
          }

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
        '';
      };
    };

    home = {
      file = {
        ".config/qt5ct/qt5ct.conf".text = ''
          [Appearance]
          custom_palette=false
          style=kvantum-dark
          icon_theme=${config.gtk.iconTheme.name}
          standard_dialogs=default

          [Fonts]
          fixed="${config.stylix.fonts.monospace.name},${toString config.stylix.fonts.sizes.applications},-1,5,5,50,0,0,0,0,Regular"
          general="${config.stylix.fonts.sansSerif.name},${toString config.stylix.fonts.sizes.applications},-1,5,50,0,0,0,0,0,Regular"

          [Interface]
          activate_item_on_single_click=1
          buttonbox_layout=0
          cursor_flash_time=1000
          dialog_buttons_have_icons=1
          double_click_interval=400
          gui_effects=@Invalid()
          keyboard_scheme=2
          menus_have_icons=true
          show_shortcuts_in_context_menus=true
          stylesheets=@Invalid()
          toolbutton_style=4
          underline_shortcut=1
          wheel_scroll_lines=3

          [SettingsWindow]
          geometry=@ByteArray(\x1\xd9\xd0\xcb\0\x3\0\0\0\0\0\0\0\0\0\0\0\0\x2\xb7\0\0\x3\x46\0\0\0\0\0\0\0\0\0\0\x2\xde\0\0\x3\x43\0\0\0\0\x2\0\0\0\x6@\0\0\0\0\0\0\0\0\0\0\x2\xb7\0\0\x3\x46)

          [Troubleshooting]
          force_raster_widgets=1
          ignored_applications=@Invalid()
        '';
        ".config/Kvantum/kvantum.kvconfig".text = ''
          [General]
          theme=KvLibadwaitaRecolor
        '';
      };

      sessionVariables = {
        #FREETYPE_PROPERTIES = "cff:no-stem-darkening=0 autofitter:no-stem-darkening=0"; # make gtk font rendering match qt
        GTK_CSD = 0;
      };

      packages = with pkgs; [
        libsForQt5.qtstyleplugin-kvantum
        #kdePackages.qtstyleplugin-kvantum
        libsForQt5.qt5ct
        #libsForQt5.qtstyleplugins
        #kdePackages.qt6ct
        adw-gtk3
        oneUiIcons
      ];
    };

    /*fonts = {
      fontconfig = {
        enable = true;
        defaultFonts.monospace = [config.stylix.fonts.monospace.name "Terminus (TTF)"];
      };
    };*/

    gtk = {
      enable = true;
      iconTheme.name = lib.mkDefault "OneUI-dark";
      gtk2 = {
        extraConfig = builtins.readFile gtkrcFile;
      };
    };

    qt = {
      enable = true;
      platformTheme.name = "qtct";
      style.name = "kvantum";
    };
  };
}
