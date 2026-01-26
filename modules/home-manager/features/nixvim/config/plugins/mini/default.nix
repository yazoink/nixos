{lib, ...}: {
  mini = {
    enable = true;
    mockDevIcons = true;
    modules = lib.mkMerge [
      {
        hipatterns = {};
        clue = {};
        indentscope = {};
      }
      (import ./icons.nix)
      (import ./pairs.nix)
      (import ./comment.nix)
      (import ./tabline.nix)
      (import ./statusline.nix)
    ];
  };
}
