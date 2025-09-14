# https://skunky.bloat.cat/media/file/ed30a86b8c4ca887773594c2/f/7c556608-0c29-4097-b9ed-6a534c379d6e/de195ph-a8ea4289-20ae-4902-942d-7520db26bb57.png/v1/fit/w_1280,h_720/bspwm_debian___by_fuut1_de195ph.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzIwIiwicGF0aCI6Ii9mLzdjNTU2NjA4LTBjMjktNDA5Ny1iOWVkLTZhNTM0YzM3OWQ2ZS9kZTE5NXBoLWE4ZWE0Mjg5LTIwYWUtNDkwMi05NDJkLTc1MjBkYjI2YmI1Ny5wbmciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.k-faIo158ERIrh8PIBGAQddCAa0QALA9ry9MmpTdN8U&filename=bspwm_debian___by_fuut1_de195ph.png
{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "idk-what-this-one-is-called") {
    desktopTheme.base16Accent = "base0D";

    stylix = {
      base16Scheme = {
        base00 = "1E1F2D";
        base01 = "2A2B39";
        base02 = "363845";
        base03 = "424450";
        base04 = "7D828B";
        base05 = "D0D8DE";
        base06 = "D0D8DE";
        base07 = "D0D8DE";
        base08 = "A37D93";
        base09 = "C99090";
        base0A = "B29C91";
        base0B = "B3AFB1";
        base0C = "AFB9C5";
        base0D = "7D8194";
        base0E = "907F94";
        base0F = "B68792";
      };
    };
  };
}
