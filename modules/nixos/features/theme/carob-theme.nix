{pkgs, ...}:
pkgs.stdenv.mkDerivation {
    name = "carob-theme";

    src = pkgs.fetchFromGitHub {
      owner = "yazoink";
      repo = "carob-theme";
      rev = "45f336b99f228e30fcd073d66720f11827eb43fd";
      sha256 = "sha256-8FMyD98YP7faOtJPZ49B5bh4jkhLnoUOdomnBz4wi8c=";
    };

    dontUnpack = true;

    installPhase = ''
      mkdir -p $out/share/sddm/themes
      mkdir -p $out/share/icons/Carob
      mkdir -p $out/share/icons/Bibata-Carob
      mkdir -p $out/share/themes
      #mkdir -p $out/share/Kvantum

      cp -r $src/cursors/Bibata-Carob/* $out/share/icons/Bibata-Carob
      cp -r $src/icons/carob/* $out/share/icons/Carob
      cp -r $src/sddm/* $out/share/sddm/themes
      #cp -r $src/kvantum/* $out/share/Kvantum
    '';
  }
