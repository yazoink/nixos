# See options/default.nix for more info on these options.
{config, ...}: {
  myOptions = {
    # ----- USER ACCOUNT ----- #
    userAccount = {
      username = "gene";
    };

    # ----- BUNDLES ----- #
    bundles = {
      base = {
        enable = true;
        starshipFormat = "1";
      };
    };
    # ----- FEATURES ----- #
    features = {
      # ollama.enable = true;
    };

    # ----- HARDWARE FEATURES ----- #
    hardwareFeatures = {
      # ssd.enable = true;
    };
  };
}
