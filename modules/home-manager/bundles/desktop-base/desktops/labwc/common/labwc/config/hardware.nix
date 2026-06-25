{osConfig, ...}: let
  inherit (osConfig.myOptions.hardwareFeatures.laptop) touchpadScrollFactor;
in {
  libinput = {
    device = [
      {
        "@category" = "touchpad";
        scrollFactor = touchpadScrollFactor;
      }
    ];
  };
}
