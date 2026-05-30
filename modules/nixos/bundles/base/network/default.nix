{
  pkgs,
  config,
  lib,
  ...
}: {
  # https://discourse.nixos.org/t/cannot-connect-to-wpa-enterprise-network/22912/9
  # https://github.com/janik-haag/nm2nix

  options = {
    bundles.base.network.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf config.bundles.base.network.enable {
    environment.systemPackages = with pkgs; [
      wpa_supplicant
    ];

    nixpkgs.overlays = [
      (self: super: {
        wpa_supplicant = super.wpa_supplicant.overrideAttrs (oldAttrs: {
          extraConfig =
            oldAttrs.extraConfig
            + ''
              CONFIG_WEP=y
              CONFIG_EAP=y
              CONFIG_IEEE8021X=y
            '';
        });
      })
    ];

    systemd.services.wpa_supplicant.environment.OPENSSL_CONF = pkgs.writeText "openssl.cnf" ''
      openssl_conf = openssl_init
      [openssl_init]
      ssl_conf = ssl_sect
      [ssl_sect]
      system_default = system_default_sect
      [system_default_sect]
      Options = UnsafeLegacyRenegotiation
      [system_default_sect]
      CipherString = Default:@SECLEVEL=0
    '';

    networking.hosts = {
      "127.0.0.1" = ["localhost"];
      "::1" = ["localhost"];
      "127.0.1.1" = ["nixserver1.localdomain" "${config.networking.hostName}"];
    };

    systemd.services.NetworkManager-wait-online.enable = false;

    networking.networkmanager = {
      enable = true;
      wifi.macAddress = "random";
      plugins = with pkgs; [
        networkmanager-strongswan
        networkmanager-openvpn
        networkmanager-openconnect
        networkmanager-vpnc
        networkmanager-l2tp
      ];

      ensureProfiles = {
        environmentFiles = ["/run/secrets/wifi_env"];
        profiles = {
          uni = {
            "802-1x" = {
              domain-suffix-match = "$UNI_DOMAIN";
              eap = "peap;";
              identity = "$UNI_IDENTITY";
              password = "$UNI_PASSWORD";
              phase2-auth = "mschapv2";
            };
            connection = {
              id = "$UNI_SSID";
              type = "wifi";
              uuid = "$UNI_CONNECTION_UUID";
            };
            ipv4 = {
              method = "auto";
            };
            ipv6 = {
              addr-gen-mode = "stable-privacy";
              method = "auto";
            };
            proxy = {};
            wifi = {
              mode = "infrastructure";
              ssid = "$UNI_SSID";
            };
            wifi-security = {
              key-mgmt = "wpa-eap";
            };
          };

          home = {
            connection = {
              id = "$HOME_SSID";
              type = "wifi";
              autoconnect = true;
            };
            wifi = {
              mode = "infrastructure";
              ssid = "$HOME_SSID";
            };
            wifi-security = {
              key-mgmt = "wpa-psk";
              psk = "$HOME_PASSWORD";
            };
            ipv4 = {
              method = "auto";
            };
            ipv6 = {
              method = "auto";
            };
          };

          home2 = {
            connection = {
              id = "$HOME_2_SSID";
              type = "wifi";
              autoconnect = true;
            };
            wifi = {
              mode = "infrastructure";
              ssid = "HOME_2_SSID";
            };
            wifi-security = {
              key-mgmt = "wpa-psk";
              psk = "$HOME_2_PASSWORD";
            };
            ipv4 = {
              method = "auto";
            };
            ipv6 = {
              method = "auto";
            };
          };

          hotspot = {
            connection = {
              id = "$HOTSPOT_SSID";
              type = "wifi";
              autoconnect = true;
            };
            wifi = {
              mode = "infrastructure";
              ssid = "$HOTSPOT_SSID";
            };
            wifi-security = {
              key-mgmt = "wpa-psk";
              psk = "$HOTSPOT_PASSWORD";
            };
            ipv4 = {
              method = "auto";
            };
            ipv6 = {
              method = "auto";
            };
          };
        };
      };
    };
  };
}
