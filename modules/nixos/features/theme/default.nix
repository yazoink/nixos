{pkgs, config, lib, ...}:
let
  carobTheme = pkgs.callPackage ./carob-theme.nix {};
in
{
  options = {
    bundles.desktopBase.theme.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf config.bundles.desktopBase.theme.enable {
    environment.systemPackages = with pkgs; [
      libsForQt5.qtquickcontrols2
      libsForQt5.qtgraphicaleffects
      gtk-engine-murrine
    ] ++ [carobTheme];

    stylix = {
      enable = true;
      targets = {
        grub.enable = false;
      };
      cursor = {
        name = "Bibata-Carob";
        size = 24;
      };
      /*base16Scheme = {
        base00 = "242120";
        base01 = "2b2726";
        base02 = "332e2b";
        base03 = "3b3431";
        base04 = "ad9b84";
        base05 = "b5a48d";
        base06 = "bdae97";
        base07 = "c8baa4";
        base08 = "c65f5f";
        base09 = "d08b65";
        base0A = "d9b27c";
        base0B = "859e82";
        base0C = "829e9b";
        base0D = "728797";
        base0E = "998396";
        base0F = "ab9382";
      };*/
      base16Scheme = {
        base00 = "181515";
        base01 = "221E1E";
        base02 = "423939";
        base03 = "6D5F5F";
        base04 = "978787";
        base05 = "B6A8A5";
        base06 = "F4E6D2";
        base07 = "CA3F3F";
        base08 = "E46A3A";
        base09 = "E39C45";
        base0A = "989F56";
        base0B = "629386";
        base0C = "517894";
        base0D = "4A5A8D";
        base0E = "9F569A";
        base0F = "C45497";
      };
      image = if config.networking.hostName == "cyberia" then ./wallpaper-cyberia.png else ./wallpaper-fluoride.png;
      fonts = {
        sizes = {
          applications = 11;
          desktop = 11;
          popups = 11;
          terminal = 12;
        };
        serif = {
          package = pkgs.gyre-fonts;
          name = "DejaVu Math TeX Gyre";
        };
        sansSerif = {
          package = pkgs.rubik;
          name = "Rubik";
        };
        monospace = {
          package = pkgs.terminus_font;
          name = "Terminus";
          #package = pkgs.anonymousPro;
          #name = "Anonymous Pro";
        };
      };
    };
  };
}
