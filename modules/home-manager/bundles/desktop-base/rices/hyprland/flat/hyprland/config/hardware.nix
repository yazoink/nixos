{
  lib,
  osConfig,
  ...
}: let
  inherit (osConfig.networking) hostName;
  inherit
    (osConfig.myOptions.hardwareFeatures.laptop)
    touchpadScrollFactor
    isThinkPad
    ;
in
  lib.mkMerge [
    {
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        scroll_points = "flat";
        numlock_by_default = true;
        touchpad = {
          disable_while_typing = true;
          scroll_factor = touchpadScrollFactor;
        };
      };
    }
    (lib.mkIf isThinkPad {
      input.kb_model = "thinkpad";
      device = [
        {
          name = "tpps/2-ibm-trackpoint";
          accel_profile = "flat";
          sensitivity = 0.5;
        }
      ];
    })
    (lib.mkIf (hostName == "fluoride") {
      monitor = [
        "DP-1,highres,auto,1.25"
        "DP-2,highres,auto,1.25"
        ",preferred,auto,1"
      ];
    })
    (lib.mkIf (hostName != "fluoride") {
      monitor = [",preferred,auto,1"];
    })
  ]
