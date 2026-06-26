{
  pkgs,
  osConfig,
  ...
}: let
  garfetch = pkgs.callPackage ./garfetch.nix {};
  inherit (osConfig.features.garfetch) style;
in {
  home.packages = [garfetch];
  home.file.".config/garfetch".source = ./. + "/config-${builtins.toString style}";
  # home.file.".config/garfetch".source = lib.mkMerge [
  #   (lib.mkIf (style == 1) ./config-1)
  #   (lib.mkIf (style == 2) ./config-2)
  # ];
}
