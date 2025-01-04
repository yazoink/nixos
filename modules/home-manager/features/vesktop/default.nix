{pkgs, config, lib, osConfig, ...}:
let
  themeFile = config.lib.stylix.colors {
    template = builtins.trace "set vesktop theme template" ./${osConfig.desktopTheme.base16Accent}.theme.css.mustache;
    extension = ".css";
  };
  inherit (osConfig.myOptions.bundles.desktopFull.vesktop) bloat;
in
{
  options = {
    bundles.desktopFull.vesktop.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.vesktop.enable {
    xdg.configFile = {
      "vesktop/themes/my.theme.css".source = if (osConfig.myOptions.desktopTheme.name == "rose-pine") 
        then ./rose-pine-discord.theme.css 
        else themeFile;
    };
    programs.nixcord = {
      enable = true;
      discord = {
        enable = false;
      };
      vesktop.enable = true;
      quickCss = ''
        :root {
          --font: ${config.stylix.fonts.sansSerif.name};
        }
      '';
      config = {
        useQuickCss = true;
        enabledThemes = ["my.theme.css"];
        transparent = false;
        enableReactDevtools = true;
        disableMinSize = true;
        plugins = {
          alwaysExpandRoles.enable = true;
          alwaysTrust = {
            enable = true;
            domain = true;
            file = true;
          };
          anonymiseFileNames = {
            enable = true;
            anonymiseByDefault = true;
            method = "timestamp";
          };
          betterFolders.enable = lib.mkIf bloat true;
          betterGifAltText.enable = lib.mkIf bloat true;
          betterGifPicker.enable = true;
          betterSettings.enable = true;
          betterUploadButton.enable = true;
          biggerStreamPreview.enable = lib.mkIf bloat true;
          callTimer.enable = lib.mkIf bloat true;
          clearURLs.enable = true;
          copyFileContents.enable = lib.mkIf bloat true;
          copyUserURLs.enable = lib.mkIf bloat true;
          decor.enable = lib.mkIf bloat true;
          emoteCloner.enable = lib.mkIf bloat true;
          experiments = {
            enable = true;
            toolbarDevMenu = true;
          };
          fakeNitro = {
            enable = true;
            enableEmojiBypass = true;
            enableStickerBypass = true;
            enableStreamQualityBypass = true;
            disableEmbedPermissionCheck = true;
          };
          favoriteEmojiFirst.enable = true;
          favoriteGifSearch.enable = true;
          fixCodeblockGap.enable = true;
          fixImagesQuality.enable = true;
          fixSpotifyEmbeds.enable = true;
          fixYoutubeEmbeds.enable = true;
          forceOwnerCrown.enable = true;
          friendsSince.enable = true;
          gifPaste.enable = true;
          iLoveSpam.enable = true;
          imageLink.enable = true;
          imageZoom = {
            enable = true;
            zoom = 2.5;
            size = 250.0;
          };
          implicitRelationships.enable = true;
          keepCurrentChannel.enable = lib.mkIf bloat true;
          loadingQuotes = {
            enable = true;
            replaceEvents = true;
            enablePluginPresetQuotes = false;
            enableDiscordPresetQuotes = false;
            additionalQuotes = "bababooey|Hawk Tuah!|look behind you|guuuuuhh uuuuuuuuuuuuhhh";
          };
          memberCount.enable = true;
          mentionAvatars.enable = true;
          messageLatency.enable = lib.mkIf bloat true;
          messageLinkEmbeds.enable = true;
          messageLogger.enable = lib.mkIf bloat true;
          moreKaomoji.enable = lib.mkIf bloat true;
          noDevtoolsWarning.enable = true;
          noF1.enable = true;
          noMaskedUrlPaste.enable = true;
          noOnboardingDelay.enable = true;
          noPendingCount = {
            enable = true;
            hideFriendRequestsCount = false;
            hideMessageRequestCount = false;
            hidePremiumOffersCount = true;
          };
          noProfileThemes.enable = true;
          noTypingAnimation.enable = true;
          noUnblockToJump.enable = true;
          nsfwGateBypass.enable = true;
          onePingPerDM.enable = true;
          permissionsViewer.enable = lib.mkIf bloat true;
          pictureInPicture.enable = true;
          pinDMs.enable = lib.mkIf bloat true;
          platformIndicators.enable = lib.mkIf bloat true;
          previewMessage.enable = true;
          relationshipNotifier.enable = true;
          replaceGoogleSearch = {
            enable = true;
            customEngineName = "4get";
            customEngineURL = "https://4get.yazo.ink/web?s=";
          };
          reverseImageSearch.enable = true;
          serverListIndicators = {
            enable = true;
            mode = "both";
          };
          showConnections.enable = true;
          showHiddenChannels.enable = true;
          showHiddenThings.enable = true;
          showMeYourName.enable = true;
          showTimeoutDuration.enable = true;
          silentTyping.enable = true;
          spotifyCrack.enable = true;
          stickerPaste.enable = true;
          translate.enable = true;
          typingTweaks.enable = true;
          unlockedAvatarZoom.enable = true;
          validReply.enable = true;
          validUser.enable = true;
          voiceDownload.enable = true;
          voiceMessages.enable = true;
          youtubeAdblock.enable = true;
          webScreenShareFixes.enable = true;
        };
      };
    };
  };
}
