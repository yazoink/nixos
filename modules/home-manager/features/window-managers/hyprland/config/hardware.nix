{
  lib,
  osConfig,
  ...
}: let
  inherit (osConfig.networking) hostName;
  inherit
    (osConfig.myOptions.hardwareFeatures.laptop)
    hyprlandTouchpadScrollFactor
    isThinkPad
    ;
in
  lib.mkMerge [
    {
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        scroll_points = "flat";
        touchpad = {
          disable_while_typing = false;
          scroll_factor = hyprlandTouchpadScrollFactor;
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
        "DP-2,2560x1440@59.95100,0x0,1"
        ",preferred,auto,1"
      ];
    })
  ]
