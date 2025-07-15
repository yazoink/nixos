{pkgs, ...}:
pkgs.python312Packages.buildPythonApplication rec {
  pname = "expenses";
  version = "1.0";
  pyproject = true;
  build-system = with pkgs.python312Packages; [setuptools];

  src = ./expenses;

  doCheck = false;
}
