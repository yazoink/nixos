{lib, ...}: {
  options.myOptions.hardwareFeatures = {
    bootloader = {
      type = lib.mkOption {
        type = lib.types.str;
        default = "uefi";
        description = "Options: uefi, legacy";
      };
      legacy = {
        bootDrive = lib.mkOption {
          type = lib.types.str;
          default = "/dev/sda";
          description = "Location of the boot drive.";
        };
        customResolution = {
          enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Only set this if you definitely have the right value.";
          };
          resolution = lib.mkOption {
            type = lib.types.str;
            default = "1024x768";
          };
        };
      };
    };
    opentabletdriver.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    bluetooth.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    touchscreen = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      hyprlandGestureSensitivity = lib.mkOption {
        type = lib.types.number;
        default = 1.5;
      };
    };
    h264ify.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    diskBurner.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    ssd.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    laptop = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      # used in hyprland and labwc
      touchpadScrollFactor = lib.mkOption {
        type = lib.types.number;
        default = 1;
      };
      batteryName = lib.mkOption {
        type = lib.types.str;
        default = "BAT0";
      };
      isThinkPad = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
  };
}
