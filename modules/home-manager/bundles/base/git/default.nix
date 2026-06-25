{pkgs, ...}: {
  home.packages = [pkgs.kdiff3];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "yazoink";
        email = "yazoink@firemail.cc";
      };
      aliases = {
        prettylog = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(r) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
        root = "rev-parse --show-toplevel";
      };
      init.defaultBranch = "main";
      core.editor = "nvim";
      merge.tool = "kdiff3";
      pull.rebase = false;
    };
  };
}
