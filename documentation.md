# Documentation

Mainly so I remember how this thing works.     
     
Basically, there are two "levels" of this config. The higher level consists of the custom configuration options declared in `options/default.nix` and set in `nixos/<hostname>/options.nix` and the lower level is everything else. The higher level allows for easy toggling and changing of anything that might need toggling or changing across the system. Ideally, once a host is set up, these are the only options that need to be touched for its configuration.

## Custom Configuration Options

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
3. Add to `nixos/<hostname>/default.nix`

```nix
{
    inputs,
    lib,
    config,
    pkgs,
    ...
}: {
    ### Imports ###
    imports = [
        ./hardware-configuration.nix
        ./options.nix
        ../../modules/nixos
        inputs.home-manager.nixosModules.home-manager
        inputs.stylix.nixosModules.stylix

        ## If supported, import nixos-hardware module ##
        # inputs.nixos-hardware.nixosModules.<nixos-hardware module>
    ];

    ### home-manager ###
    home-manager = {
        extraSpecialArgs = { inherit inputs; };
        useGlobalPkgs = true;
        useUserPackages = true;
        users."${config.myOptions.userAccount.username}" = {
            imports = [ ../../home-manager ];
        };
    };

    ### Graphics drivers (if not using nixos-hardware) ###
    hardware = {
        graphics = {
            enable = true;
            # enable32Bit = true; # if using steam

            ## legacy Intel drivers ##
            /*
            extraPackages = with pkgs; [
                intel-vaapi-driver
                libvdpau-va-gl
                intel-media-sdk
            ];
            */
        };
        ## AMDGPU drivers ##
        /*
        amdgpu = {
            initrd.enable = true;
            amdvlk = {
                enable = true;
                support32Bit.enable = true;
            };
        };
        */
    };

    ## Legacy Intel driver ##
    /*
    environment.sessionVariables = {
        LIBVA_DRIVER_NAME = "i965";
    };
    */

    ## AMDGPU driver ##
    # services.xserver.videoDrivers = ["amdgpu"];

    ### Bootloader ###
    boot.loader = {
        ## UEFI ##
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;

        ## Legacy ##
        /*
        grub = {
            enable = true;
            device = "/dev/sda"; # change /dev/sda to boot drive if applicable
            # gfxmodeBios = "1024x768"; # set if applicable
            theme = null;
            splashImage = null;
        };
        */
    };

    networking.hostName = "<hostname>";

    services.openssh = {
        enable = true;
        settings = {
            PermitRootLogin = "no";
            # PasswordAuthentication = false;
        };
    };

    system.stateVersion = "24.05";
}
```

4. Create file `nixos/<hostname>/options.nix`:

```nix
    ## This will set up a basic desktop ##
    myOptions = {
        userAccount.username = "<username>";
        desktopTheme = {
            # name = "everblush";
            wallpaper = {
                type = "image"
                image = {
                    fillType = "fill";
                    path = ../../wallpapers/<image>;
                };
                # color.hex = config.stylix.base16Scheme.base03;
            };
            sddm = {
                # scale = 1;
                wallpaper = ../../wallpapers/<image>;
            };
        };
        bundles = {
            ## Enable at least one ##
            # base.enable = true;
            desktopBase = {
                enable = true;
                # windowManager = "hyprland";
                # displayManager = "sddm";
            };
            # desktopFull.enable = true;
        };
        features = {};
        hardwareFeatures = {
            # h264ify.enable = true;
            # diskBurner.enable = true;
            # ssd.enable = true;
            # laptop = {
            #     enable = true;
            #     hyprlandTouchpadScrollFactor = 0.5;
            #     batteryName = "BAT1";
            # };
        };
    };
```

6. Add any wallpapers to `wallpapers/` and select one if using a desktop.
7. Create directory `home-manager/<hostname>`.
8. Add to `home-manager/default.nix`:

```nix
...
imports = [
    ...
    ./<hostname>
];
...
```

9. Add to `home-manager/<hostname>/default.nix`:

```nix
{osConfig, lib, ...}:
let
    inherit (osConfig.myOptions.userAccount) username;
in
lib.mkIf (osConfig.networking.hostName == "<hostname>") {
    home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        sessionVariables = {
            EDITOR = "nvim";
            BROWSER = "${osConfig.myOptions.defaultApps.webBrowser.command}";
            # STEAM_EXTRA_COMPAT_TOOLS_PATH = "\${HOME}/.steam/root/compatibilitytools.d";
        };
        stateVersion = "24.05";
    };
}
```

10. You will probably need to update the flake inputs before building from this config for the first time or there will likely be errors out the Ass.
