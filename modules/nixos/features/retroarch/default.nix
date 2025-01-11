{pkgs, config, lib, ...}:
{
  config = lib.mkIf config.myOptions.features.retroarch.enable {
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
