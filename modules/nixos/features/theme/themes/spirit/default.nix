{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "spirit") {
    # I made this one
    desktopTheme.base16Accent = "base0E";
    stylix = {
      base16Scheme = {
        base00 = "212121";
        base01 = "35332E";
        base02 = "48463C";
        base03 = "5C5849";
        base04 = "847D64";
        base05 = "ABA27F";
        base06 = "ABA27F";
        base07 = "ABA27F";
        base08 = "734748";
        base09 = "7B5C4D";
        base0A = "7E6A53";
        base0B = "807858";
        base0C = "63685C";
        base0D = "465860";
        base0E = "763F41";
        base0F = "75554F";
      };
    };
  };
}
