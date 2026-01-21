{
  pkgs,
  config,
  lib,
  ...
}: let
  manuscriptTheme = pkgs.callPackage ./manuscript-theme.nix {};
in {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.colorscheme == "manuscript") {
    desktopTheme.base16Accent = "base0A";
    desktopTheme.icons = {
      name = "Manuscript-Icons";
      package = manuscriptTheme;
    };

    stylix = {
      cursor = {
        name = "Bibata-Manuscript";
        package = manuscriptTheme;
      };
      base16Scheme = {
        base00 = "292A2A";
        base01 = "403E38";
        base02 = "575347";
        base03 = "6E6755";
        base04 = "9C9071";
        base05 = "CAB98E";
        base06 = "CAB98E";
        base07 = "CAB98E";
        base08 = "C24B47";
        base09 = "A64D3D";
        base0A = "9A8351";
        base0B = "658254";
        base0C = "34748D";
        base0D = "424977";
        base0E = "876250";
        base0F = "7A5646";
      };
    };
  };
}
