{lib, ...}: {
  # ----- USER ACCOUNT ----- #
  #
  # Options for the user account.

  options.myOptions.userAccount = {
    username = lib.mkOption {
      type = lib.types.str;
      default = "gene";
    };
  };
}
