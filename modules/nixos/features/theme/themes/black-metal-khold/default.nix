{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "black-metal-khold") {
    desktopTheme.base16Accent = "base08";

    stylix = {
      base16Scheme = {
        base00 = "000000";
        base01 = "121212";
        base02 = "222222";
        base03 = "333333";
        base04 = "999999";
        base05 = "C1C1C1";
        base06 = "999999";
        base07 = "C1C1C1";
        base08 = "5F8787";
        base09 = "AAAAAA";
        base0A = "974B46";
        base0B = "ECEEE3";
        base0C = "AAAAAA";
        base0D = "888888";
        base0E = "999999";
        base0F = "444444";
      };
    };
  };
}
