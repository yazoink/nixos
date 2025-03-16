{
  pkgs,
  config,
  lib,
  ...
}: let
  retroarchWithCores = pkgs.retroarch.withCores (cores:
    with cores; [
      mgba
      beetle-psx
      beetle-psx-hw
      bsnes
      bsnes-hd
      desmume
      dolphin
      easyrpg
      flycast
      mupen64plus
      pcsx2
      pcsx-rearmed
      ppsspp
    ]);
in {
  config = lib.mkIf config.myOptions.features.retroarch.enable {
    environment.systemPackages = with pkgs; [
      retroarchWithCores
    ];
  };
}
