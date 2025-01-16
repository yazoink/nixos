# Documentation
Mainly so I remember how this thing works.

## Global Custom Options
The custom options defined in `options/default.nix` for system configuration. These options should be defined in `nixos/<hostname>/default.nix`.

### myOptions.defaultApps
Default applications.
See `options/default.nix` for the supported types of applications and their options.

### myOptions.defaultApps.\<type>.command
Command to launch the app.

### myOptions.defaultApps.\<type>.desktopFile
Name of the desktop entry file.

### myOptions.userAccount
Settings for the user account.

### myOptions.userAccount.username
Sets the username.

### myOptions.desktopTheme
Configure the desktop theme.

### myOptions.desktopTheme.name
Sets the theme to use.
#### Options
- caroline (default)
- carob
- tarot
- manuscript
- rose-pine
- rose-pine-moon
- wizard
- atelier-savanna
- blood-rust
- embers
- mountain
- spirit
- swamp
- terracotta
- twilight
- darkmoss
- gruvbox-dark-hard
- gruvbox-material-dark-hard
- biscuit
- everblush
- levuaska
- mountain-peek

### myOptions.desktopTheme.wallpaper
Path to the desktop wallpaper.

### myOptions.desktopTheme.fonts.terminal.name
Set the terminal font.
#### Options
- GeistMono Nerd Font
- Bm437 NEC APC3 8x16
- Iosevka Nerd Font
- ZedMono Nerd Font
- Cascadia Code
- VictorMono Nerd Font

### myoptions.desktoptheme.fonts.desktop.name
set the desktop font.
#### options
- Rubik
- SF Pro Display
- DM Sans
- Gabarito
- Lexend
- Product Sans
- Roboto

### myOptions.desktopTheme.fonts.\<desktop/terminal>.size
Set the terminal/desktop font size.

### myOptions.desktopTheme.terminalPadding
Set the terminal padding.

### myOptions.desktopTheme.sddm
Configure the SDDM theme.

### myOptions.desktopTheme.sddm.scale
Sets the scale for the SDDM theme.

### myOptions.desktopTheme.sddm.wallpaper
Path to the wallpaper to use for the SDDM theme.

### myOptions.desktopTheme.firefoxCss.\<name>.enable
Enables Firefox userChrome.css themes. Not recommended to enable more than one at once.

### myOptions.desktopTheme.firefoxCss.shyfox.wallpaper
Path to the new tab background image.

### myOptions.bundles
Bundles of modules.

### myOptions.bundles.base.enable
Enables the base features needed for a TTY-only setup.

### myOptions.bundles.base.starshipFormat
Set the Starship prompt theme/format (1-3).

### myOptions.bundles.desktopBase.enable
Enables the base features needed for a desktop including a window manager, display manager, web browser and other basic utilities.
This module automatically enables `myOptions.bundles.base`.

### myOptions.bundles.desktopBase.windowManager
Choose which window manager to install.
#### Options:
- hyprland (default)
- sway

### myOptions.bundles.desktopBase.displayManager
Choose which display manager to install.
#### Options:
- sddm (default)
- regreet

### myOptions.bundles.desktopFull.enable
Enables all desktop features including music players, media editors, libreoffice, vesktop, etc.
This module automatically enables `myOptions.bundles.desktopBase`.

### myOptions.bundles.desktopFull.vesktop.bloat
Disabling this installs less vesktop plugins.

### myOptions.features.\<name>.enable
Enable individual applications/services/etc which may not need to be included on every host, thus excluding them from bundles.
See `options/default.nix` for the available features.

### myOptions.hardwareFeatures.\<name>.enable
Enable features related to specific hardware.
See `options/default.nix`.

### myOptions.hardwareFeatures.laptop.touchpadScrollFactor
Scroll factor to set for laptop touchpad in Hyprland.

## Custom Options (local to features)
The options which are not intended for use outside `modules/`. The global custom options are essentially an abstraction for this part of the config.

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

## Adding hosts
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
        ../../modules/nixos
        inputs.home-manager.nixosModules.home-manager
        inputs.stylix.nixosModules.stylix
        
        ## If supported, import nixos-hardware module ##
        # inputs.nixos-hardware.nixosModules.<nixos-hardware module>
    ];

    ### Custom options (see top of page for more info/options) ###
    ## This will set up a basic desktop ##
    myOptions = {
        userAccount.username = "<username>";
        desktopTheme = {
            # name = "caroline";
            wallpaper = ./wallpapers/<image>;
            sddm = {
                #scale = 1;
                wallpaper = ./wallpapers/<image>;
            };
            # firefoxCss.anotherOneline.enable = true;
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
            # laptop.enable = true;
            # ssd.enable = true;
        };
    };

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
4. Create directory `nixos/nixos/<hostname>/wallpapers` and add any specified wallpapers there.
5. Create directory `home-manager/<hostname>`.
6. Add to `home-manager/default.nix`:
```nix
...
imports = [
    ...
    ./<hostname>
];
...
```
7. Add to `home-manager/<hostname>/default.nix`:
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
