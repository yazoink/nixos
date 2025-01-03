{pkgs, ...}:
pkgs.python312Packages.buildPythonApplication rec {
  pname = "simple-logout";
  version = "1.0";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "simple-logout";
    rev = "main";
    sha256 = "sha256-HxRq7zsVQVxYEnsIQrQ657lT/JDsPeIlRQiAq3MZkec=";
  };

  nativeBuildInputs = [
    pkgs.gobject-introspection
    pkgs.wrapGAppsHook
  ];

  propagatedBuildInputs = with pkgs.python312Packages; [
    pygobject3
    sh
  ] ++ [
    pkgs.gtk-layer-shell
    pkgs.gtk3
    pkgs.python3
  ];

  makeWrapperArgs = [
    "--prefix GI_TYPELIB_PATH : ${pkgs.gtk3}/lib/girepository-1.0"
    "--prefix LD_LIBRARY_PATH : ${pkgs.gtk3}/lib"
  ];

  doCheck = false;
}
