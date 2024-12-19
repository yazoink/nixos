{ pkgs, ... }:
pkgs.python312Packages.buildPythonApplication rec {
  pname = "soundboard";
  version = "1.0";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "soundboard";
    rev = "main";
    sha256 = "sha256-XxtYx1HOAWG24y3Nr9o3E2wrhdnLvU8m9eCUy5aoOao=";
  };

  nativeBuildInputs = [
    pkgs.gobject-introspection
    pkgs.wrapGAppsHook
  ];

  propagatedBuildInputs = with pkgs.python312Packages; [
    pygobject3
    sh
  ] ++ [
    pkgs.gtk3
  ];

  makeWrapperArgs = [
    "--prefix GI_TYPELIB_PATH : ${pkgs.gtk3}/lib/girepository-1.0"
    "--prefix LD_LIBRARY_PATH : ${pkgs.gtk3}/lib"
  ];

  installPhase = ''
    mkdir -p $out/share/soundboard
    cp -r sounds $out/share/soundboard/sounds
  '';

  doCheck = false;
}
