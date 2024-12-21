{pkgs, config, lib, ...}:
let
  #carobTheme = pkgs.callPackage ./carob-theme.nix {};
  carolineSddm = pkgs.callPackage ./caroline-sddm.nix {};
  carolineCursors = pkgs.callPackage ./caroline-cursors.nix {};
  carolineIcons = pkgs.callPackage ./caroline-icons.nix {};
  #kirsch = pkgs.callPackage ./kirsch {};
  #castella = pkgs.callPackage ./castella {};
  #triskweline = pkgs.callPackage ./triskweline {};
  necApcIII = pkgs.callPackage ./nec-apc-3 {};
  #ibmModel3x = pkgs.callPackage ./ibm-model3x {};
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
    ] ++ [carolineSddm carolineCursors carolineIcons];

    stylix = {
      enable = true;
      targets = {
        grub.enable = false;
      };
      cursor = {
        name = "caroline-bibata-modern";
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
        base00 = "1c1213";
        base01 = "3a2425";
        base02 = "563837";
        base03 = "6d4745";
        base04 = "8b5d57";
        base05 = "a87569";
        base06 = "c58d7b";
        base07 = "e3a68c";
        base08 = "c24f57";
        base09 = "a63650";
        base0A = "f28171";
        base0B = "806c61";
        base0C = "6b6566";
        base0D = "684c59";
        base0E = "a63650";
        base0F = "893f45";
      };
      image = if config.networking.hostName == "cyberia" then ./wallpapers/cyberia/caroline-flowers.png else ./wallpapers/fluoride/caroline-flowers.png;
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
          #package = pkgs.gohufont;
          #name = "Gohufont";
          package = pkgs.curie;
          name = "curie";
          #package = necApcIII;
          #name = "Bm437 NEC APC3 8x16";
        };
      };
    };
  };
}
