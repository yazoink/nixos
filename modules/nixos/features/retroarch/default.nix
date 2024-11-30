{pkgs, config, lib, ...}:
{
  options = {
    bundles.desktopFull.retroarch.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.retroarch.enable {
    environment.systemPackages = with pkgs; [
      retroarch.withCores [
        genesis-plus-gx
        snes9x
        beetle-psx-hw
        beetle-gba
        desmume
        dolphin
        dosbox-pure
        easyrpg
        mupen64plus
        nestopia
        pcsx2
        ppsspp
        flycast
      ]
    ];
  };
}
