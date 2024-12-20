{pkgs, config, lib, ...}:
let
  themeFile = config.lib.stylix.colors {
    template = ./my.theme.css.mustache;
    extension = ".css";
  };
in
{
  options = {
    bundles.desktopFull.vesktop.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.vesktop.enable {
    home.packages = with pkgs; [
      vesktop
    ];
    xdg.configFile = {
      "vesktop/themes/my.theme.css".source = themeFile;
      "vesktop/config.json".text = ''
        {
          "discordBranch": "ptb",
          "minimizeToTray": true,
          "arRPC": false,
          "splashColor": "#${config.stylix.base16Scheme.base05}",
          "splashBackground": "#${config.stylix.base16Scheme.base00}",
          "splashTheming": true,
          "tray": true,
          "clickTrayToShowHide": true,
          "spellCheckLanguages": [
            "en-AU",
            "en-US",
            "en-GB",
            "en"
          ]
        }
      '';
      "vesktop/settings/settings.json".text = ''
        {
          "autoUpdate": true,
          "autoUpdateNotification": true,
          "useQuickCss": true,
          "themeLinks": [],
          "enabledThemes": ["my.theme.css"],
          "enableReactDevTools": true,
          "frameless": false,
          "transparent": false,
          "winCtrlQ": false,
          "disableMinSize": true,
          "winNativeTitleBar": false,
          "plugins": {
            "ChatInputButtonAPI": {
              "enabled": true
            },
            "CommandsAPI": {
              "enabled": true
            },
            "MemberListDecoratorsAPI": {
              "enabled": false
            },
            "MessageAccessoriesAPI": {
              "enabled": true
            },
            "MessageDecorationsAPI": {
              "enabled": false
            },
            "MessageEventsAPI": {
              "enabled": true
            },
            "MessagePopoverAPI": {
              "enabled": false
            },
            "MessageUpdaterAPI": {
              "enabled": true
            },
            "ServerListAPI": {
              "enabled": true
            },
            "UserSettingsAPI": {
              "enabled": true
            },
            "AlwaysAnimate": {
              "enabled": false
            },
            "AlwaysExpandRoles": {
              "enabled": false
            },
            "AlwaysTrust": {
              "enabled": true,
              "domain": true,
              "file": true
            },
            "AnonymiseFileNames": {
              "enabled": true
            },
            "AppleMusicRichPresence": {
              "enabled": false
            },
            "WebRichPresence (arRPC)": {
              "enabled": false
            },
            "BANger": {
              "enabled": false
            },
            "BetterFolders": {
              "enabled": true,
              "sidebar": true,
              "showFolderIcon": 1,
              "keepIcons": false,
              "closeAllHomeButton": false,
              "closeAllFolders": false,
              "forceOpen": false,
              "sidebarAnim": true
            },
            "BetterGifAltText": {
              "enabled": false
            },
            "BetterGifPicker": {
              "enabled": true
            },
            "BetterNotesBox": {
              "enabled": false
            },
            "BetterRoleContext": {
              "enabled": true
            },
            "BetterRoleDot": {
              "enabled": false
            },
            "BetterSessions": {
              "enabled": false,
              "backgroundCheck": false,
              "checkInterval": 20
            },
            "BetterSettings": {
              "enabled": true,
              "disableFade": true,
              "eagerLoad": true
            },
            "BetterUploadButton": {
              "enabled": true
            },
            "BiggerStreamPreview": {
              "enabled": true
            },
            "BlurNSFW": {
              "enabled": false
            },
            "CallTimer": {
              "enabled": true
            },
            "ClearURLs": {
              "enabled": true
            },
            "ClientTheme": {
              "enabled": false
            },
            "ColorSighted": {
              "enabled": false
            },
            "ConsoleJanitor": {
              "enabled": false
            },
            "ConsoleShortcuts": {
              "enabled": false
            },
            "CopyEmojiMarkdown": {
              "enabled": false
            },
            "CopyFileContents": {
              "enabled": true
            },
            "CopyUserURLs": {
              "enabled": true
            },
            "CrashHandler": {
              "enabled": true
            },
            "CtrlEnterSend": {
              "enabled": false
            },
            "CustomRPC": {
              "enabled": false
            },
            "CustomIdle": {
              "enabled": false
            },
            "Dearrow": {
              "enabled": false
            },
            "Decor": {
              "enabled": false
            },
            "DisableCallIdle": {
              "enabled": false
            },
            "DontRoundMyTimestamps": {
              "enabled": false
            },
            "EmoteCloner": {
              "enabled": false
            },
            "Experiments": {
              "enabled": true,
              "toolbarDevMenu": true
            },
            "F8Break": {
              "enabled": false
            },
            "FakeNitro": {
              "enabled": false,
              "enableEmojiBypass": true,
              "emojiSize": 48,
              "transformEmojis": true,
              "enableStickerBypass": true,
              "stickerSize": 160,
              "transformStickers": true,
              "transformCompoundSentence": false,
              "enableStreamQualityBypass": true,
              "useHyperLinks": true,
              "hyperLinkText": "{{NAME}}",
              "disableEmbedPermissionCheck": false
            },
            "FakeProfileThemes": {
              "enabled": false
            },
            "FavoriteEmojiFirst": {
              "enabled": true
            },
            "FavoriteGifSearch": {
              "enabled": true
            },
            "FixCodeblockGap": {
              "enabled": true
            },
            "FixSpotifyEmbeds": {
              "enabled": true
            },
            "FixYoutubeEmbeds": {
              "enabled": true
            },
            "ForceOwnerCrown": {
              "enabled": false
            },
            "FriendInvites": {
              "enabled": false
            },
            "FriendsSince": {
              "enabled": true
            },
            "GameActivityToggle": {
              "enabled": false
            },
            "GifPaste": {
              "enabled": true
            },
            "GreetStickerPicker": {
              "enabled": false
            },
            "HideAttachments": {
              "enabled": false
            },
            "iLoveSpam": {
              "enabled": true
            },
            "IgnoreActivities": {
              "enabled": false
            },
            "ImageLink": {
              "enabled": true
            },
            "ImageZoom": {
              "enabled": true,
              "size": 345.481152601645,
              "zoom": 4.352109237455986,
              "nearestNeighbour": false,
              "square": true,
              "saveZoomValues": true,
              "invertScroll": true,
              "zoomSpeed": 0.5
            },
            "ImplicitRelationships": {
              "enabled": true,
              "sortByAffinity": true
            },
            "InvisibleChat": {
              "enabled": false
            },
            "KeepCurrentChannel": {
              "enabled": false
            },
            "LastFMRichPresence": {
              "enabled": false
            },
            "LoadingQuotes": {
              "enabled": true,
              "replaceEvents": true,
              "enablePluginPresetQuotes": true,
              "enableDiscordPresetQuotes": false,
              "additionalQuotes": ":3|bababooey|Hawk Tuah!|guuuuuuuuh uhh|Look behind you",
              "additionalQuotesDelimiter": "|"
            },
            "MemberCount": {
              "enabled": true,
              "memberList": true,
              "toolTip": true
            },
            "MentionAvatars": {
              "enabled": false
            },
            "MessageClickActions": {
              "enabled": false
            },
            "MessageLatency": {
              "enabled": true
            },
            "MessageLinkEmbeds": {
              "enabled": false
            },
            "MessageLogger": {
              "enabled": true,
              "deleteStyle": "text",
              "logDeletes": true,
              "collapseDeleted": false,
              "logEdits": true,
              "inlineEdits": true,
              "ignoreBots": false,
              "ignoreSelf": false,
              "ignoreUsers": "",
              "ignoreChannels": "",
              "ignoreGuilds": ""
            },
            "MessageTags": {
              "enabled": false
            },
            "MoreCommands": {
              "enabled": false
            },
            "MoreKaomoji": {
              "enabled": true
            },
            "MoreUserTags": {
              "enabled": false
            },
            "Moyai": {
              "enabled": false
            },
            "MutualGroupDMs": {
              "enabled": false
            },
            "NewGuildSettings": {
              "enabled": false
            },
            "NoBlockedMessages": {
              "enabled": false
            },
            "NoDefaultHangStatus": {
              "enabled": false
            },
            "NoDevtoolsWarning": {
              "enabled": true
            },
            "NoF1": {
                "enabled": true
            },
            "NoMaskedUrlPaste": {
              "enabled": false
            },
            "NoMosaic": {
              "enabled": false
            },
            "NoOnboardingDelay": {
              "enabled": false
            },
            "NoPendingCount": {
              "enabled": false
            },
            "NoProfileThemes": {
              "enabled": false
            },
            "NoReplyMention": {
              "enabled": false
            },
            "NoScreensharePreview": {
              "enabled": false
            },
            "NoServerEmojis": {
              "enabled": false
            },
            "NoTypingAnimation": {
              "enabled": false
            },
            "NoUnblockToJump": {
              "enabled": false
            },
            "NormalizeMessageLinks": {
              "enabled": true
            },
            "NotificationVolume": {
              "enabled": false
            },
            "NSFWGateBypass": {
              "enabled": true
            },
            "OnePingPerDM": {
              "enabled": false
            },
            "oneko": {
              "enabled": false
            },
            "OpenInApp": {
              "enabled": true
            },
            "OverrideForumDefaults": {
              "enabled": false
            },
            "PartyMode": {
              "enabled": false
            },
            "PauseInvitesForever": {
              "enabled": false
            },
            "PermissionFreeWill": {
              "enabled": false
            },
            "PermissionsViewer": {
              "enabled": true
            },
            "petpet": {
              "enabled": false
            },
            "PictureInPicture": {
              "enabled": false
            },
            "PinDMs": {
              "enabled": false
            },
            "PlainFolderIcon": {
              "enabled": false
            },
            "PlatformIndicators": {
              "enabled": true
            },
            "PreviewMessage": {
              "enabled": false
            },
            "QuickMention": {
              "enabled": false
            },
            "QuickReply": {
              "enabled": false
            },
            "ReactErrorDecoder": {
              "enabled": false
            },
            "ReadAllNotificationsButton": {
              "enabled": true
            },
            "RelationshipNotifier": {
              "enabled": true,
              "offlineRemovals": true,
              "groups": true,
              "servers": true,
              "friends": true,
              "friendRequestCancels": true
            },
            "ReplaceGoogleSearch": {
              "enabled": true,
              "customEngineURL": "https://4get.yazo.ink/web?s=",
              "customEngineName": "4get"
            },
            "ReplyTimestamp": {
              "enabled": false
            },
            "RevealAllSpoilers": {
              "enabled": false
            },
            "ReverseImageSearch": {
              "enabled": true
            },
            "ReviewDB": {
              "enabled": false
            },
            "RoleColorEverywhere": {
              "enabled": false
            },
            "SecretRingToneEnabler": {
              "enabled": false
            },
            "Summaries": {
              "enabled": false
            },
            "SendTimestamps": {
              "enabled": true
            },
            "ServerInfo": {
              "enabled": true
            },
            "ServerListIndicators": {
              "enabled": true,
              "mode": 2
            },
            "ShikiCodeblocks": {
              "enabled": false
            },
            "ShowAllMessageButtons": {
              "enabled": false
            },
            "ShowConnections": {
              "enabled": true
            },
            "ShowHiddenChannels": {
              "enabled": true,
              "showMode": 0,
              "hideUnreads": true
            },
            "ShowHiddenThings": {
              "enabled": true,
              "showTimeouts": true,
              "showInvitesPaused": true,
              "showModView": true,
              "disableDiscoveryFilters": true,
              "disableDisallowedDiscoveryFilters": true
            },
            "ShowMeYourName": {
              "enabled": true,
              "displayNames": false,
              "mode": "user-nick",
              "inReplies": false
            },
            "ShowTimeoutDuration": {
              "enabled": false
            },
            "SilentMessageToggle": {
              "enabled": false
            },
            "SilentTyping": {
              "enabled": true,
              "isEnabled": true,
              "showIcon": false
            },
            "SortFriendRequests": {
              "enabled": false
            },
            "SpotifyControls": {
              "enabled": false
            },
            "SpotifyCrack": {
              "enabled": false
            },
            "SpotifyShareCommands": {
              "enabled": false
            },
            "StartupTimings": {
              "enabled": false
            },
            "StickerPaste": {
              "enabled": true
            },
            "StreamerModeOnStream": {
              "enabled": false
            },
            "SuperReactionTweaks": {
              "enabled": false
            },
            "TextReplace": {
              "enabled": false
            },
            "ThemeAttributes": {
              "enabled": false
            },
            "TimeBarAllActivities": {
              "enabled": false
            },
            "Translate": {
              "enabled": false
            },
            "TypingIndicator": {
              "enabled": false
            },
            "TypingTweaks": {
              "enabled": false
            },
            "Unindent": {
              "enabled": false
            },
            "UnlockedAvatarZoom": {
              "enabled": true
            },
            "UnsuppressEmbeds": {
              "enabled": false
            },
            "UserVoiceShow": {
              "enabled": false
            },
            "USRBG": {
              "enabled": false
            },
            "ValidReply": {
              "enabled": false
            },
            "ValidUser": {
              "enabled": true
            },
            "VoiceChatDoubleClick": {
              "enabled": false
            },
            "VcNarrator": {
              "enabled": false
            },
            "VencordToolbox": {
              "enabled": true
            },
            "ViewIcons": {
              "enabled": false
            },
            "ViewRaw": {
              "enabled": false
            },
            "VoiceDownload": {
              "enabled": true
            },
            "VoiceMessages": {
              "enabled": true
            },
            "VolumeBooster": {
              "enabled": false
            },
            "WebKeybinds": {
              "enabled": true
            },
            "WebScreenShareFixes": {
              "enabled": true
            },
            "WhoReacted": {
              "enabled": true
            },
            "XSOverlay": {
              "enabled": false
            },
            "YoutubeAdblock": {
              "enabled": true
            },
            "NoTrack": {
              "enabled": true,
              "disableAnalytics": true
            },
            "WebContextMenus": {
              "enabled": true,
              "addBack": true
            },
            "Settings": {
              "enabled": true,
              "settingsLocation": "aboveNitro"
            },
            "SupportHelper": {
              "enabled": true
            },
            "AccountPanelServerProfile": {
              "enabled": false
            },
            "FullSearchContext": {
              "enabled": true
            },
            "UserMessagesPronouns": {
              "enabled": false
            },
            "DynamicImageModalAPI": {
              "enabled": true
            },
            "FixImagesQuality": {
              "enabled": true
            }
          },
          "notifications": {
            "timeout": 5000,
            "position": "top-right",
            "useNative": "not-focused",
            "logLimit": 50
          },
          "cloud": {
            "authenticated": false,
            "url": "https://api.vencord.dev/",
            "settingsSync": false,
            "settingsSyncVersion": 1724624485343
          }
        }
      '';
    };
  };
}
