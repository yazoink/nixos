{
  config,
  pkgs,
  osConfig,
  ...
}: let
  qtctConf = with config.stylix; ''
    [Appearance]
    custom_palette=false
    style=kvantum
    icon_theme=${iconTheme.${polarity}}
    standard_dialogs=default

    [Fonts]
    fixed="${fonts.monospace.name},${toString fonts.sizes.applications},-1,5,5,50,0,0,0,0,Regular"
    general="${fonts.sansSerif.name},${toString fonts.sizes.applications},-1,5,50,0,0,0,0,0,Regular"

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
  kvantumGenerator = ./kvantum-generator/generate_kvantum.py;
in {
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
  stylix.targets.qt.enable = false;
  home.file = {
    ".config/qt5ct/qt5ct.conf".text = qtctConf;
    ".config/qt6ct/qt6ct.conf".text = qtctConf;
    ".config/Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=KvLibadwaitaRecolor
    '';
  };
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };
}
