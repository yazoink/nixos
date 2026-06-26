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
        ...
    };
}
```

The bundles currently available are: `base`, `desktopBase`, and `desktopFull`.

`base` includes the configurations required to get a bare minimum system with no GUI.

`desktopBase` includes all the configurations in `base`, plus a basic desktop. The desktop can be configured with the options under `myOptions.desktopTheme`.

`desktopFull` includes all the configurations included in `base`, and `desktopBase`, plus a variety of extras.

There are multiple different desktop configurations, including Labwc, and Hyprland, with different themes. The individual WM configurations can be found under `<nixos/home-manager>/bundles/desktopBase/desktops`, and their respective themes can be found under `<nixos/home-manager>/bundles/desktopBase/desktops/<WM>/<theme>`. Shared desktop configs can be found under `<nixos/home-manager>/bundles/desktopBase/desktops/<WM>/common` (shared between WMs), and `<nixos/home-manager>/bundles/desktopBase/desktops/<WM>/common` (shared between themes).
