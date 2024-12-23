{pkgs, ...}:
pkgs.python312Packages.buildPythonApplication rec {
  pname = "simple-logout";
  version = "1.0";

  src = ./replacecolor;

  propagatedBuildInputs = with pkgs.python312Packages; [
    pillow
    numpy
  ];

  doCheck = false;
}
