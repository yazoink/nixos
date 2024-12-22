{pkgs, ...}:
pkgs.stdenv.mkDerivation {
    name = "carob-theme";

    src = pkgs.fetchFromGitHub {
      owner = "yazoink";
      repo = "carob-theme";
      rev = "30959777a63c9d21e6ed7cf2b10b2fcdca142dbd";
      sha256 = "sha256-z+lEZYVgRWc2Hv07K/UFK2/fOJPtWLd1m3P65UQSBr8=";
    };

    dontUnpack = true;

    installPhase = ''
      mkdir -p $out/share/sddm/themes
      mkdir -p $out/share/icons
      mkdir -p $out/share/icons
      mkdir -p $out/share/themes
      #mkdir -p $out/share/Kvantum

      cp -r $src/cursors/* $out/share/icons
      cp -r $src/icons/* $out/share/icons
      cp -r $src/sddm/* $out/share/sddm/themes
      #cp -r $src/kvantum/* $out/share/Kvantum
    '';
  }
