{pkgs, ...}:
pkgs.python312Packages.buildPythonApplication rec {
  pname = "replacecolor";
  version = "1.0";

  src = ./replacecolor;

  propagatedBuildInputs = with pkgs.python312Packages; [
    pillow
    numpy
  ];

  doCheck = false;
}
