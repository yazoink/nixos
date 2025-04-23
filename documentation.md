# Documentation

Mainly so I remember how this thing works.     
     
Basically, there are two "levels" of this config. The higher level consists of the custom configuration options declared in `options/default.nix` and set in `nixos/<hostname>/options.nix` and the lower level is everything else. The higher level allows for easy toggling and changing of anything that might need toggling or changing across the system. Ideally, once a host is set up, these are the only options that need to be touched for its configuration.

## Custom Options

Refer to `options/default.nix`. These must be set in `nixos/<hostname>/options.nix`.

## Lower Level Custom Options

The options which are not intended for use outside `modules/`. The higher level custom options are essentially an abstraction for this part of the config.

### bundles.\<bundle>.\<name>.enable

Enables a module/feature. These options are typically defined in `modules/<home-manager/nixos>/bundles/<name>/default.nix`
but can also be enabled within `modules/<home-manager/nixos>/features/<name>` if they are only needed if another specific feature is enabled.
In the case of the latter, the option should not be enabled in `modules/<home-manager/nixos>/bundles/<name>/default.nix`.

### utils.\<name>.enable

Enables a module which serves as a utility for building the system (such as a script that's run on a rebuild to help configure a specific module).

Depending on the module, `utils.<name>` and `bundles.<bundle>.<name>` may also contain other options such as `.package`, etc.

### desktopTheme.base16Accent

Sets the accent color for the base16 colorscheme used to to theme the desktop.
This option is set for each individual theme in `modules/nixos/features/theme/themes/<name>/default.nix`.

#### options:

- base08
- base09
- base0A
- base0B
- base0C
- base0D (default)
- base0E
- base0F

## How To Add a Host

1. Add to `flake.nix`:

```nix
{
    ...
    nixosConfigurations = {
        ...
        <hostname> = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs system; };
            modules = [
                ./options
                ./nixos/<hostname>
            ];
        };
    };
    ...
}
```

2. Make directory `nixos/<hostname>` and copy `/etc/nixos/hardware-configuration.nix` into it.
3. Copy `nixos/<template>/default.nix` to `nixos/<hostname>/default.nix` and edit to suit the host.
4. Copy either `nixos/<template>/options-base.nix`, `nixos/<template>/options-desktop-base.nix` or `nixos/<template>/options-desktop-full.nix` to `nixos/<hostname>/options.nix`, depending on what kind of configuration you want for this host. Edit it to suit.
5. You will probably need to update the flake inputs before building from this config for the first time or there will likely be errors out the Ass.
