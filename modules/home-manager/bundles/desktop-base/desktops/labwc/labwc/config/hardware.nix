{osConfig, ...}: let
  inherit (osConfig.myOptions.hardwareFeatures.laptop) labwcTouchpadScrollFactor;
in {
  libinput = {
    device = [
      {
        "@category" = "touchpad";
        scrollFactor = labwcTouchpadScrollFactor;
      }
    ];
  };
}
