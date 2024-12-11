# depends on system theme module
{osConfig, pkgs, lib, config, ...}:
let
  gtkrcFile = config.lib.stylix.colors {
    template = ./gtkrc.mustache;
    extension = ".css";
  };
in
{
  config = lib.mkIf osConfig.bundles.desktopBase.theme.enable {
    stylix = {
      targets = {
        waybar.enable = false;
        gtk.extraCss = with config.stylix.base16Scheme; ''
          @define-color headerbar_bg_color #${base00};
          @define-color dialog_bg_color #${base00};
          @define-color popover_bg_color #${base00};
          @define-color accent_color #${base0D};
          @define-color accent_bg_color #${base0D};
        '';
      };
    };

    home = {
      file = {
        ".config/qt5ct/qt5ct.conf".text = ''
          [Appearance]
          color_scheme_path=/home/gene/.config/qt5ct/colors/test.conf
          custom_palette=false
          icon_theme=Carob
          standard_dialogs=default
          style=kvantum-dark

          [Fonts]
          fixed="${config.stylix.fonts.monospace.name},11,-1,5,5,50,0,0,0,0,Regular"
          general="${config.stylix.fonts.sansSerif.name},11,-1,5,50,0,0,0,0,0,Regular"

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
      };

      sessionVariables = {
        FREETYPE_PROPERTIES = "cff:no-stem-darkening=0 autofitter:no-stem-darkening=0"; # make gtk font rendering match qt
        GTK_CSD = 0;
      };

      packages = with pkgs; [
        libsForQt5.qtstyleplugin-kvantum
        #kdePackages.qtstyleplugin-kvantum
        libsForQt5.qt5ct
        #kdePackages.qt6ct
        adw-gtk3
      ];
    };
     
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = lib.mkForce "prefer-dark";
      };
    };

    gtk = {
      enable = true;
      iconTheme.name = "caroline-suru-aspromauros";
      gtk2 = {
        extraConfig = builtins.readFile gtkrcFile;
      };
      gtk3.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
        '';
      };
      gtk4.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
        '';
      };
    };

    qt = {
      enable = true;
      platformTheme.name = "qtct";
      style.name = "kvantum";
    };

    xdg.configFile = {
      "Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=caroline-kvantum
      '';
    "Kvantum/caroline-kvantum".source = ./caroline-kvantum;
    };
  };
}
