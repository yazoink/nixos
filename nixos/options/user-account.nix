{lib, ...}: {
  options.myOptions.userAccount = {
    username = lib.mkOption {
      type = lib.types.str;
      default = "gene";
    };
  };
}
