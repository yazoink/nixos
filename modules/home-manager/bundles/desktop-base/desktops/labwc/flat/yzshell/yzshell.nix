{
  pkgs,
  lib,
  ...
}:
pkgs.stdenv.mkDerivation rec {
  name = "yzshell";
  src = ./yzshell;
  # dontUnpack = true;
  buildInputs = with pkgs; [
    makeWrapper
    bash
    curl
    jq
    lm_sensors
    eww
    mako
    libnotify
    waybar
    font-awesome
    wtype
    (python3.withPackages (python-pkgs:
      with python-pkgs; [
        pygobject3
      ]))
  ];
  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share/yzshell
    cp $src/yzshell $out/bin
    cp -r $src/assets $out/share/yzshell
    cp -r $src/colourschemes $out/share/yzshell
    cp -r $src/configs $out/share/yzshell
    cp -r $src/functions $out/share/yzshell
    wrapProgram $out/bin/yzshell \
      --set YZSHELL_CMD "$out/bin/yzshell" \
      --set YZSHELL_DIR "$out/share/yzshell" \
      --prefix PATH : ${lib.makeBinPath buildInputs}
  '';
}
