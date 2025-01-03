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
- rosepine
- wizard
- atelier-savanna
- blood-rust
- embers
- mountain
- spirit
- swamp
- terracotta
- twilight

### myOptions.desktopTheme.wallpaper
Path to the desktop wallpaper.

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

### myOptions.features.<name>.enable
Enable individual applications/services/etc which may not need to be included on every host, thus excluding them from bundles.
See `options/default.nix` for the available features.

### myOptions.hardwareFeatures.<name>.enable
Enable features related to specific hardware.
See `options/default.nix`.

## Custom Options (local to features)
The options which are not intended for use outside `modules/`. The global custom options are essentially an abstraction for this part of the config.

### bundles.<bundle>.<name>.enable
Enables a module/feature. These options are typically defined in `modules/<home-manager/nixos>/bundles/<name>/default.nix`
but can also be enabled within `modules/<home-manager/nixos>/features/<name>` if they are only needed if another specific feature is enabled.
In the case of the latter, the option should not be enabled in `modules/<home-manager/nixos>/bundles/<name>/default.nix`.

### utils.<name>.enable
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

### desktopTheme.custom\<Terminal/Desktop>Font.enable
Enabled a font which is not in nixpkgs. This font is set in `modules/nixos/features/theme/<terminal/desktop>-fonts`
and the option is enabled in `modules/nixos/features/theme/default.nix`.
If it's disabled, it will fall back to a font from nixpkgs.
