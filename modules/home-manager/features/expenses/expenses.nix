{pkgs, ...}:
pkgs.python312Packages.buildPythonApplication rec {
  pname = "soundboard";
  version = "1.0";

  src = ./expenses;

  doCheck = false;
}
