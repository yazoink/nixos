{ pkgs, ... }:
pkgs.python312Packages.buildPythonApplication rec {
  pname = "lyricli";
  version = "1.0";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "lyricli";
    rev = "main";
    sha256 = "sha256-XxtYx1HOAWG24y3Nr9o3E2wrhdnLvU8m9eCUy5aoOao=";
  };

  propagatedBuildInputs = with pkgs.python312Packages; [
    requests
    beautifulsoup4
  ];

  doCheck = false;
}
