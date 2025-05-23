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
        starshipFormat = 1;
        ssh = {
          allowPasswordAuth = true;
          allowRootLogin = false;
        };
      };
    };
    # ----- FEATURES ----- #
    features = {
      # ollama.enable = true;
      # expenses.enable = true;
    };

    # ----- HARDWARE FEATURES ----- #
    hardwareFeatures = {
      # ssd.enable = true;

      # --> UEFI bootloader
      bootloader.type = "uefi";

      # --> Legacy bootloader
      # bootloader = {
      #   type = "legacy";
      #   legacy = {
      #     bootDrive = "/dev/sda"; # make sure this is the right drive
      #     customResolution = {
      #       enable = false;
      #       resolution = "1024x768";
      #     };
      #   };
      # };
    };
  };
}
