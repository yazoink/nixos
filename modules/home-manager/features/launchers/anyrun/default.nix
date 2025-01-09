{config, inputs, lib, pkgs, ...}:
{
  options = {
    bundles.desktopBase.anyrun.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.anyrun.enable {
    home.packages = [inputs.anyrun.packages."x86_64-linux".anyrun];
    programs.anyrun = {
      enable = true;
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = true;
      closeOnClick = true;
      maxEntries = null;
      showResultsImmediately = false;
      plugins = [
        inputs.anyrun.packages.${pkgs.system}.applications
        "${inputs.anyrun.packages.${pkgs.system}.anyrun-with-all-plugins}/lib/kidex"
      ];
    };
  };
}
