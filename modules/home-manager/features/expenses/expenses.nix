{pkgs, ...}:
pkgs.python312Packages.buildPythonApplication rec {
  pname = "expenses";
  version = "1.0";
  pyproject = true;
  build-system = ["setup-tools"];

  src = ./expenses;

  doCheck = false;
}
