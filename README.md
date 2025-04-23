# NixOS
My NixOS desktop configs with home-manager.

## Hosts
- Cyberia: Coreboot ThinkPad T430
- Fluoride: Desktop PC (R5 5600/RX 6600)
- Stardust: Acer TravelMate B113-E netbook

## Software
- WM: Hyprland/SwayFX
- Bar: Waybar
- Launcher: Rofi/Wofi/Anyrun
- Terminal: Foot/Alacritty/Kitty
- Editor: Neovim
- Browser: Firefox/Zen/Brave/Librewolf
- File manager: Thunar/Yazi
- Notifications: Mako/SwayNC
- Display manager: SDDM/ReGreet
- Lockscreen: Hyprlock/Gtklock
- Shell: Zsh
- Prompt: Starship

## Features
- Consistent theming across Gtk/Qt and pretty much everything else
- Auto-generated theme based on the current stylix base16 colorscheme for everything except icons and cursors
- Ability to easily toggle between desktop colorschemes in config
- Declarative Etterna package/installation (works sometimes)
- [Script](https://github.com/yazoink/nixos/blob/main/modules/home-manager/features/shell-config/scripts/rebuild/rebuild) for rebuilding the system that notifies you when it's done
- [Script](https://github.com/yazoink/nixos/blob/main/modules/home-manager/features/shell-config/scripts/clean/clean) for cleaning the system that notifies you when it's done
- Various other [useful scripts](https://github.com/yazoink/nixos/tree/main/modules/home-manager/features/shell-config/scripts)
- Custom options for easy toggling of features (see [here](https://github.com/yazoink/nixos/tree/main/options/default.nix)).

## Documentation
See [documentation.md](./documentation.md)
  
## Screenshots
![1742555549627](https://github.com/user-attachments/assets/f6b142ba-3873-48ff-9216-00879df519f4)
(hyprland + everblush theme)

![20250422_17:42:14_screenshot](https://github.com/user-attachments/assets/f1cbfb30-c328-4706-b2aa-8e381cd7c0e0)
(hyprland + moonfly theme)

![20250126_21:54:32_screenshot](https://github.com/user-attachments/assets/1322e8f8-dc31-4a55-a02b-df2f07b3cfcc)
(sway + levuaska theme)

![hyprlock](https://github.com/user-attachments/assets/22db2890-6042-41ef-9415-53587d89efda)
(hyprlock + moonfly theme)

![20250103_14:44:29_screenshot](https://github.com/user-attachments/assets/f510d75f-528b-4f19-8a3a-bf155aa5cc5e)
(sddm + caroline theme)
