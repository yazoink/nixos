{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.colorscheme == "vesper") {
    desktopTheme.base16Accent = "base0D";

    stylix = {
      base16Scheme = {
        base00 = "101010";
        base01 = "1D1D1D";
        base02 = "2A2A2A";
        base03 = "373737";
        base04 = "999999";
        base05 = "b7b7b7";
        base06 = "c1c1c1";
        base07 = "D5D5D5";
        base08 = "DE6E6E";
        base09 = "DAB083";
        base0A = "FFC799";
        base0B = "5F8787";
        base0C = "60A592";
        base0D = "8EAAAA";
        base0E = "D69094";
        base0F = "876C4F";
      };
    };
  };
}
