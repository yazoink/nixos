# NixOS
My NixOS desktop configs with home-manager and Hyprland.

## Hosts
- Cyberia: Coreboot ThinkPad T430
- Fluoride: Desktop PC (R5 5600/RX 6600)
- Stardust: Acer TravelMate B113-E netbook

## Software
- WM: Hyprland/SwayFX
- Bar: Waybar
- Launcher: Rofi/Wofi/Anyrun
- Terminal: Foot
- Editor: Neovim
- Browser: Firefox/Zen
- File manager: Thunar/Yazi
- Notifications: Mako/SwayNC
- Display manager: SDDM/ReGreet
- Shell: Zsh
- Prompt: Starship

## Features
- Consistent theming across GTK/Qt and pretty much everything else
- Auto-generated theme based on the current stylix base16 colorscheme for everything except icons and cursors
- Ability to easily toggle between desktop colorschemes in config
- Customized Firefox with [Betterfox](https://github.com/yokoffing/BetterFox) and toggleable userChrome.css themes
- Declarative Etterna package/installation
- [Script](https://github.com/yazoink/nixos/blob/main/modules/home-manager/features/shell-config/scripts/rebuild/rebuild) for rebuilding the system that notifies you when it's done
- [Script](https://github.com/yazoink/nixos/blob/main/modules/home-manager/features/shell-config/scripts/clean/clean) for cleaning the system that notifies you when it's done
- Custom options for easy toggling of features (see [here](https://github.com/yazoink/nixos/tree/main/options)).

## Documentation
See [documentation.md](./documentation.md)
  
## Screenshots
![1742555549627](https://github.com/user-attachments/assets/f6b142ba-3873-48ff-9216-00879df519f4)
(hyprland + everblush theme)

![1737986796055](https://github.com/user-attachments/assets/8d3fd41f-a801-41aa-95b2-cd4fef6a208b)
(hyprland + paradise theme)

![20250126_21:54:32_screenshot](https://github.com/user-attachments/assets/1322e8f8-dc31-4a55-a02b-df2f07b3cfcc)
(sway + levuaska theme)

![20250103_14:44:29_screenshot](https://github.com/user-attachments/assets/f510d75f-528b-4f19-8a3a-bf155aa5cc5e)
(sddm + caroline theme)
