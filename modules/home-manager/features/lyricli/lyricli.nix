{ pkgs, ... }:
pkgs.python312Packages.buildPythonApplication rec {
  pname = "lyricli";
  version = "1.0";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "lyricli";
    rev = "main";
    sha256 = "sha256-EvBdDrGVo6CSrsFxWw8/k2YANUvgtjPUETOy3GyCMnU=";
  };

  propagatedBuildInputs = with pkgs.python312Packages; [
    requests
    beautifulsoup4
  ];

  doCheck = false;
}
