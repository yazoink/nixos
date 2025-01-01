{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "blood-rust") {
    desktopTheme.base16Accent = "base08";

    stylix = {
      base16Scheme = {
        base00 = "1F2932";
        base01 = "343D46";
        base02 = "48505A";
        base03 = "5D646E";
        base04 = "717881";
        base05 = "AFB3BD";
        base06 = "AFB3BD";
        base07 = "AFB3BD";
        base08 = "7C545F";
        base09 = "7C685A";
        base0A = "7C7C54";
        base0B = "547C71";
        base0C = "54737C";
        base0D = "63647C";
        base0E = "72547C";
        base0F = "5E4D52";
      };
    };
  };
}
