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
      (retroarch.withCores [
        libretro.snes9x
        libretro.beetle-psx-hw
        libretro.beetle-gba
        libretro.desmume
        libretro.pcsx2
        libretro.mupen64plus
        libretro.dolphin
        libretro.flycast
        libretro.ppsspp
        libretro.nestopia
        libretro.easyrpg
      ])
    ];
  };
}
