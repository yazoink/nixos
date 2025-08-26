{pkgs, ...}:
pkgs.python312Packages.buildPythonApplication rec {
  pname = "hyprviewbinds";
  version = "1.0";
  pyproject = true;
  build-system = with pkgs.python312Packages; [setuptools];

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "HyprViewBinds";
    rev = "bdd187191a413eebfd1205b536c58437f300da0a";
    sha256 = "sha256-XxtYx1HOAWG24y3Nr9o3E2wrhdnLvU8m9eCUy5aoOao=";
  };

  nativeBuildInputs = with pkgs; [
    wrapGAppsHook
    glib
  ];

  propagatedBuildInputs = with pkgs; [
    (python3.withPackages (p:
      with p; [
        pygobject3
        sh
      ]))
    gtk3
    gobject-introspection
    wrapGAppsHook
  ];

  makeWrapperArgs = [
    "--prefix GI_TYPELIB_PATH : ${pkgs.gtk3}/lib/girepository-1.0"
    "--prefix LD_LIBRARY_PATH : ${pkgs.gtk3}/lib"
  ];

  doCheck = false;
}
