{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.colorscheme == "rose-pine") {
    desktopTheme.base16Accent = "base0B";
    desktopTheme.iconTheme = {
      name = "oomox-rose-pine";
      package = pkgs.rose-pine-icon-theme;
    };

    stylix = {
      cursor = {
        name = "BreezeX-RosePineDawn-Linux";
        package = pkgs.rose-pine-cursor;
        size = 32;
      };
      base16Scheme = {
        base00 = "191724";
        base01 = "262432";
        base02 = "343240";
        base03 = "413F4E";
        base04 = "838193";
        base05 = "E0DEF4";
        base06 = "E0DEF4";
        base07 = "56526E";
        base08 = "EB6F92";
        base09 = "F6C177";
        base0A = "EA9A97";
        base0B = "3E8FB0";
        base0C = "9CCFD8";
        base0D = "C4A7E7";
        base0E = "F6C177";
        base0F = "56526E";
      };
    };
  };
}
