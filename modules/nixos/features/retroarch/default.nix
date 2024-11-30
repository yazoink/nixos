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
      (retroarch.withCores (libretro: with libretro; [
        snes9x
        beetle-psx-hw
        beetle-gba
        desmume
        pcsx2
        mupen64plus
        dolphin
        flycast
        ppsspp
        nestopia
        easyrpg
      ]))
    ];
  };
}
