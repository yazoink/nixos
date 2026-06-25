{pkgs, ...}: {
  services.acpid.enable = true;
  environment.systemPackages = with pkgs; [acpi];
}
