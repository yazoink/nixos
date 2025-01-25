{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "haze") {
    desktopTheme.base16Accent = "base08";

    stylix = {
      base16Scheme = {
        base00 = "12171B";
        base01 = "1D2024";
        base02 = "282A2E";
        base03 = "333337";
        base04 = "6B6366";
        base05 = "B8A5A8";
        base06 = "B8A5A8";
        base07 = "B8A5A8";
        base08 = "704955";
        base09 = "75515D";
        base0A = "795964";
        base0B = "7E615E";
        base0C = "80615F";
        base0D = "7F6567";
        base0E = "825058";
        base0F = "8D6067";
      };
    };
  };
}
