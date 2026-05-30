{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.colorscheme == "mountain-peek") {
    desktopTheme.base16Accent = "base0D";

    stylix = {
      base16Scheme = {
        base00 = "101216";
        base01 = "1B1E25";
        base02 = "232730";
        base03 = "313743";
        base04 = "4b5365";
        base05 = "a7b5cd";
        base06 = "b4c0d4";
        base07 = "d6deed";
        base08 = "973d46";
        base09 = "BC7648";
        base0A = "e0ae4a";
        base0B = "7ca25c";
        base0C = "5f9f9e";
        base0D = "517ba5";
        base0E = "94628a";
        base0F = "893740";
      };
    };
  };
}
