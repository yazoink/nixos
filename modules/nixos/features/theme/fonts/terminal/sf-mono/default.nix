{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.fonts.terminal.name == "SFMono") {
    stylix = {
      fonts = {
        monospace = {
          package = pkgs.callPackage ./sf-mono.nix {};
          name = "SFMono";
        };
      };
    };
  };
}
