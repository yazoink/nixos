{pkgs, config, lib, ...}:
{
  options = {
    bundles.desktopBase.acpi.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.acpi.enable {
    services.acpid.enable = true;
    environment.systemPackages = with pkgs; [acpi];
  };
}
