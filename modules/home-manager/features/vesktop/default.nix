{pkgs, config, lib, osConfig, ...}:
let
  themeFile = config.lib.stylix.colors {
    template = builtins.trace "set vesktop theme template" ./${osConfig.desktopTheme.base16Accent}.theme.css.mustache;
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
    xdg.configFile = {
      "vesktop/themes/my.theme.css".source = themeFile;
    };
    programs.nixcord = {
      enable = true;
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
          betterFolders.enable = true;
          betterGifAltText.enable = true;
          betterGifPicker.enable = true;
          betterSettings.enable = true;
          betterUploadButton.enable = true;
          biggerStreamPreview.enable = true;
          callTimer.enable = true;
          clearURLs.enable = true;
          copyFileContents.enable = true;
          copyUserURLs.enable = true;
          decor.enable = true;
          emoteCloner.enable = true;
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
            size = 150;
          };
          implicitRelationships.enable = true;
          keepCurrentChannel.enable = true;
          loadingQuotes = {
            enable = true;
            replaceEvents = true;
            enablePluginPresetQuotes = false;
            enableDiscordPresetQuotes = false;
            additionalQuotes = "bababooey|Hawk Tuah!|look behind you|guuuuuhh uuuuuuuuuuuuhhh";
          };
          memberCount.enable = true;
          mentionAvatars.enable = true;
          messageLatency.enable = true;
          messageLinkEmbeds.enable = true;
          messageLogger.enable = true;
          moreKaomoji.enable = true;
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
          permissionsViewer.enable = true;
          pictureInPicture.enable = true;
          pinDMs.enable = true;
          platformIndicators.enable = true;
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
