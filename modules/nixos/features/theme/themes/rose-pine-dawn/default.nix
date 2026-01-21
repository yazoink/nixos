{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.colorscheme == "rose-pine-dawn") {
    desktopTheme.base16Accent = "base0B";
    desktopTheme.icons = {
      name = "rose-pine-dawn";
      package = pkgs.rose-pine-icon-theme;
    };

    stylix = builtins.trace "rose-pine-dawn enabled" {
      polarity = "light";
      cursor = {
        name = "BreezeX-RosePineDawn-Linux";
        package = pkgs.rose-pine-cursor;
        size = 32;
      };
      base16Scheme = {
        base00 = "FAF4ED";
        base02 = "FFFAF3";
        base01 = "F2E9DE";
        base03 = "9893A5";
        base04 = "797593";
        base05 = "575279";
        base06 = "575279";
        base07 = "CECACD";
        base08 = "B4637A";
        base09 = "EA9D34";
        base0A = "D7827E";
        base0B = "286983";
        base0C = "56949F";
        base0D = "907AA9";
        base0E = "EA9D34";
        base0F = "CECACD";
      };
    };
  };
}
