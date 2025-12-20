# I'm pretty sure this was from dotshare.it
{
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.colorscheme == "i-forgor") {
    desktopTheme.base16Accent = "base0D";

    stylix = {
      base16Scheme = {
        base00 = "101010";
        base01 = "1C1F1F";
        base02 = "292E2E";
        base03 = "353D3D";
        base04 = "809898";
        base05 = "CBF3F3";
        base06 = "CBF3F3";
        base07 = "CBF3F3";
        base08 = "A33C3D";
        base09 = "A36A3C";
        base0A = "A3B370";
        base0B = "46A468";
        base0C = "49ACAA";
        base0D = "5CA4CC";
        base0E = "BD7BB5";
        base0F = "6B292A";
      };
    };
  };
}
