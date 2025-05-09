{
  inputs,
  osConfig,
  lib,
  ...
}: let
  inherit (osConfig.myOptions.hardwareFeatures) h264ify;
  addonPkgs = inputs.firefox-addons.packages."x86_64-linux";
in {
  extensions.packages = with addonPkgs;
    lib.mkMerge [
      [
        ublock-origin
        sponsorblock
        stylus
        violentmonkey
        localcdn
        clearurls
        #foxytab
        libredirect
        floccus
        control-panel-for-twitter
      ]
      (lib.mkIf h264ify.enable [enhanced-h264ify])
    ];
}
