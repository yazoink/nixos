{pkgs, ...}:
pkgs.python312Packages.buildPythonApplication rec {
  pname = "hyprviewbinds";
  version = "1.0";
  pyproject = true;
  build-system = ["setup-tools"];

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "HyprViewBinds";
    rev = "bdd187191a413eebfd1205b536c58437f300da0a";
    sha256 = "sha256-XxtYx1HOAWG24y3Nr9o3E2wrhdnLvU8m9eCUy5aoOao=";
  };

  nativeBuildInputs = [
    pkgs.gobject-introspection
    pkgs.wrapGAppsHook
  ];

  propagatedBuildInputs = with pkgs.python312Packages;
    [
      pygobject3
      sh
    ]
    ++ [
      pkgs.gtk3
    ];

  makeWrapperArgs = [
    "--prefix GI_TYPELIB_PATH : ${pkgs.gtk3}/lib/girepository-1.0"
    "--prefix LD_LIBRARY_PATH : ${pkgs.gtk3}/lib"
  ];

  doCheck = false;
}
