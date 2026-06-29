# Modules

Configuration modules. System modules can be found under `nixos/`, and home-manager, under `home-manager`. Some configs have counterparts in both directories, which share the same structure.

Modules are separated into two categories: "bundle" modules, and "feature" modules. Bundles are groups of modules that can be enabled via the user config modules declared in `/nixos/options` and set in `/hosts/<hostname>/options.nix`.

Example:

```nix
{...}: {
    myOptions = {
        ...
        bundles = {
            someBundle.enable = true;
            someOtherBundle.enable = false;
        };
        features = {
            someFeature.enable = true;
            someOtherFeature.enable = false;
        };
        ...
    };
}
```

bundles may also have configurable options in themselves:

```nix
{...}: {
    myOptions = {
        ...
        bundles.someBundle = {
            enable = true;
            bundleOption = 2;
            anotherBundleOption = "something or other";
        };
        ...
    };
}
```

## Available Bundles

The bundles currently available are: `base`, `desktopBase` `desktopFull`, `dev`, and `art`.

### Base

`myOptions.bundles.base.enable = true;`

`base` includes the configurations required to get a bare minimum system with no GUI.

### desktopBase

`myOptions.bundles.desktopBase.enable = true;`

`desktopBase` includes all the configurations in `base`, plus a basic desktop. There are multiple different desktop configurations, including Labwc, and Hyprland, with different styles. The individual WM configurations can be found under `<nixos/home-manager>/bundles/desktopBase/desktops`, and their respective styles can be found under `<nixos/home-manager>/bundles/desktopBase/desktops/<WM>/<theme>`. Shared desktop configs can be found under `<nixos/home-manager>/bundles/desktopBase/desktops/common` (shared between WMs), and `<nixos/home-manager>/bundles/desktopBase/desktops/<WM>/common` (shared between styles).

The desktop can be customised with the options under `myOptions.bundles.desktopBase.desktop`.

Example:

```nix
{...}: {
    myOptions = {
        ...
        bundles.desktopBase.desktop = {
            windowManager.name = "labwc";
            windowManager.labwc.style = "flat";
            colorscheme = "paradise";
            fonts.desktop = {
                name = "gabarito";
                size = 11;
            };
            fonts.terminal = {
                name = "aporetic-serif-mono";
                size = 12;
            };
            wallpaper = {
                type = "image";
                path = ./wallpaper.png;
            };
        };
        ...
    };
}
```

### desktopFull

`myOptions.bundles.desktopFull.enable = true;`

`desktopFull` includes all the configurations included in `base`, and `desktopBase`, plus a variety of extras.

### dev

Misc development tools.

### art

Software for making art, plus tablet drivers.
