{pkgs, ...}:
pkgs.python312Packages.buildPythonApplication rec {
  pname = "expenses";
  version = "1.0";

  src = ./expenses;

  doCheck = false;
}
