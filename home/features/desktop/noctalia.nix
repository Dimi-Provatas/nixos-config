{
  enable = true;

  settings = {
    settingsVersion = 0;

    bar = {
      barType = "simple";
      position = "top";
      monitors = [ ];
      density = "compact";
      showOutline = true;
      showCapsule = false;
      capsuleOpacity = 1;
      capsuleColorKey = "none";
      widgetSpacing = 6;
      contentPadding = 2;
      fontScale = 1;
      enableExclusionZoneInset = true;
      backgroundOpacity = 0.75;
      useSeparateOpacity = true;
      marginVertical = 4;
      marginHorizontal = 4;
      frameThickness = 8;
      frameRadius = 12;
      outerCorners = false;
      hideOnOverview = false;
      displayMode = "always_visible";
      autoHideDelay = 500;
      autoShowDelay = 150;
      showOnWorkspaceSwitch = true;
      widgets = {
        left = [
          {
            colorizeDistroLogo = false;
            colorizeSystemIcon = "secondary";
            colorizeSystemText = "none";
            customIconPath = "";
            enableColorization = false;
            icon = "niri";
            id = "ControlCenter";
            useDistroLogo = true;
          }
          {
            characterCount = 2;
            colorizeIcons = false;
            emptyColor = "secondary";
            enableScrollWheel = true;
            focusedColor = "primary";
            followFocusedScreen = false;
            fontWeight = "bold";
            groupedBorderOpacity = 1;
            hideUnoccupied = false;
            iconScale = 0.8;
            id = "Workspace";
            labelMode = "index";
            occupiedColor = "secondary";
            pillSize = 0.6;
            showApplications = true;
            showApplicationsHover = false;
            showBadge = true;
            showLabelsOnlyWhenOccupied = true;
            unfocusedIconsOpacity = 1;
          }
        ];
        center = [
          {
            compactMode = true;
            hideMode = "hidden";
            hideWhenIdle = false;
            id = "MediaMini";
            maxWidth = 256;
            panelShowAlbumArt = true;
            scrollingMode = "hover";
            showAlbumArt = true;
            showArtistFirst = true;
            showProgressRing = true;
            showVisualizer = true;
            textColor = "none";
            useFixedWidth = false;
            visualizerType = "wave";
          }
        ];
        right = [
          {
            defaultSettings = {
              hideBackground = false;
              minimumThreshold = 10;
            };
            id = "plugin:catwalk";
          }
          {
            blacklist = [ ];
            chevronColor = "none";
            colorizeIcons = false;
            drawerEnabled = true;
            hidePassive = false;
            id = "Tray";
            pinned = [ ];
          }
          {
            id = "plugin:clipboard";
          }
          {
            hideWhenZero = false;
            hideWhenZeroUnread = false;
            iconColor = "none";
            id = "NotificationHistory";
            showUnreadBadge = true;
            unreadBadgeColor = "primary";
          }
          {
            compactMode = false;
            diskPath = "/";
            iconColor = "none";
            id = "SystemMonitor";
            showCpuCores = false;
            showCpuFreq = false;
            showCpuTemp = true;
            showCpuUsage = true;
            showDiskAvailable = false;
            showDiskUsage = false;
            showDiskUsageAsPercent = false;
            showGpuTemp = true;
            showLoadAverage = false;
            showMemoryAsPercent = false;
            showMemoryUsage = true;
            showNetworkStats = true;
            showSwapUsage = false;
            textColor = "none";
            useMonospaceFont = true;
            usePadding = false;
          }
          {
            applyToAllMonitors = true;
            displayMode = "alwaysShow";
            iconColor = "none";
            id = "Brightness";
            textColor = "none";
          }
          {
            displayMode = "alwaysShow";
            iconColor = "none";
            id = "Volume";
            middleClickCommand = "wezterm -e pulsemixer";
            textColor = "none";
          }
          {
            deviceNativePath = "__default__";
            displayMode = "icon-always";
            hideIfIdle = false;
            hideIfNotDetected = true;
            id = "Battery";
            showNoctaliaPerformance = true;
            showPowerProfiles = true;
          }
          {
            displayMode = "forceOpen";
            iconColor = "none";
            id = "KeyboardLayout";
            showIcon = true;
            textColor = "none";
          }
          {
            clockColor = "none";
            customFont = "MesloLGS Nerd Font";
            formatHorizontal = "yyyy/MM/dd - HH:mm:ss";
            formatVertical = "HH mm - dd MM";
            id = "Clock";
            tooltipFormat = "HH:mm ddd, MMM dd";
            useCustomFont = true;
          }
        ];
      };
      mouseWheelAction = "workspace";
      reverseScroll = false;
      mouseWheelWrap = true;
      middleClickAction = "none";
      middleClickFollowMouse = false;
      middleClickCommand = "";
      rightClickAction = "controlCenter";
      rightClickFollowMouse = true;
      rightClickCommand = "";
      screenOverrides = [ ];
    };
    general = {
      avatarImage = "/home/thesheepster/nix-config/home/thesheepster/user-icon.png";
      dimmerOpacity = 0.2;
      showScreenCorners = false;
      forceBlackScreenCorners = false;
      scaleRatio = 1;
      radiusRatio = 1;
      iRadiusRatio = 1;
      boxRadiusRatio = 1;
      screenRadiusRatio = 1;
      animationSpeed = 1;
      animationDisabled = true;
      compactLockScreen = false;
      lockScreenAnimations = false;
      lockOnSuspend = true;
      showSessionButtonsOnLockScreen = true;
      showHibernateOnLockScreen = false;
      enableLockScreenMediaControls = false;
      enableShadows = false;
      enableBlurBehind = true;
      shadowDirection = "bottom_right";
      shadowOffsetX = 2;
      shadowOffsetY = 3;
      language = "";
      allowPanelsOnScreenWithoutBar = true;
      showChangelogOnStartup = false;
      telemetryEnabled = false;
      enableLockScreenCountdown = true;
      lockScreenCountdownDuration = 10000;
      autoStartAuth = false;
      allowPasswordWithFprintd = false;
      clockStyle = "custom";
      clockFormat = "hh\\nmm";
      passwordChars = true;
      lockScreenMonitors = [ ];
      lockScreenBlur = 0;
      lockScreenTint = 0;
      keybinds = {
        keyUp = [ "Up" ];
        keyDown = [ "Down" ];
        keyLeft = [ "Left" ];
        keyRight = [ "Right" ];
        keyEnter = [
          "Return"
          "Enter"
        ];
        keyEscape = [ "Esc" ];
        keyRemove = [ "Del" ];
      };
      reverseScroll = false;
      smoothScrollEnabled = false;
    };
    ui = {
      fontDefault = "MesloLGS Nerd Font";
      fontFixed = "MesloLGS Nerd Font Mono";
      fontDefaultScale = 1;
      fontFixedScale = 1;
      tooltipsEnabled = true;
      scrollbarAlwaysVisible = false;
      boxBorderEnabled = true;
      panelBackgroundOpacity = 0.93;
      translucentWidgets = false;
      panelsAttachedToBar = true;
      settingsPanelMode = "attached";
      settingsPanelSideBarCardStyle = false;
    };
    location = {
      name = "Stuttgart";
      weatherEnabled = true;
      weatherShowEffects = true;
      weatherTaliaMascotAlways = false;
      useFahrenheit = false;
      use12hourFormat = false;
      showWeekNumberInCalendar = false;
      showCalendarEvents = true;
      showCalendarWeather = true;
      analogClockInCalendar = false;
      firstDayOfWeek = 0;
      hideWeatherTimezone = false;
      hideWeatherCityName = false;
      autoLocate = true;
    };
    calendar = {
      cards = [
        {
          enabled = true;
          id = "calendar-header-card";
        }
        {
          enabled = true;
          id = "calendar-month-card";
        }
        {
          enabled = true;
          id = "weather-card";
        }
      ];
    };
    wallpaper = {
      enabled = true;
      overviewEnabled = false;
      directory = "/home/thesheepster/Pictures/Wallpapers";
      monitorDirectories = [ ];
      enableMultiMonitorDirectories = false;
      showHiddenFiles = false;
      viewMode = "single";
      setWallpaperOnAllMonitors = true;
      linkLightAndDarkWallpapers = true;
      fillMode = "stretch";
      fillColor = "#000000";
      useSolidColor = false;
      solidColor = "#1a1a2e";
      automationEnabled = false;
      wallpaperChangeMode = "random";
      randomIntervalSec = 300;
      transitionDuration = 500;
      transitionType = [
        "fade"
        "disc"
        "stripes"
        "wipe"
        "pixelate"
        "honeycomb"
      ];
      skipStartupTransition = false;
      transitionEdgeSmoothness = 0;
      panelPosition = "follow_bar";
      hideWallpaperFilenames = false;
      useOriginalImages = false;
      overviewBlur = 0.4;
      overviewTint = 0.6;
      useWallhaven = true;
      wallhavenQuery = "trans";
      wallhavenSorting = "relevance";
      wallhavenOrder = "desc";
      wallhavenCategories = "111";
      wallhavenPurity = "111";
      wallhavenRatios = "16x9";
      wallhavenApiKey = "4cAK8o7d0QamFnBSq7Qt9NKcBnSHJ36U";
      wallhavenResolutionMode = "atleast";
      wallhavenResolutionWidth = "";
      wallhavenResolutionHeight = "";
      sortOrder = "name";
      favorites = [ ];
    };
    appLauncher = {
      enableClipboardHistory = true;
      autoPasteClipboard = false;
      enableClipPreview = true;
      clipboardWrapText = true;
      enableClipboardSmartIcons = true;
      enableClipboardChips = true;
      clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
      clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
      position = "center";
      pinnedApps = [ ];
      sortByMostUsed = true;
      # terminalCommand = "alacritty -e";
      terminalCommand = "wezterm cli spawn";
      customLaunchPrefixEnabled = false;
      customLaunchPrefix = "";
      viewMode = "list";
      showCategories = true;
      iconMode = "native";
      showIconBackground = false;
      enableSettingsSearch = true;
      enableWindowsSearch = true;
      enableSessionSearch = true;
      ignoreMouseInput = false;
      screenshotAnnotationTool = "";
      overviewLayer = false;
      density = "default";
    };
    controlCenter = {
      position = "close_to_bar_button";
      diskPath = "/";
      shortcuts = {
        left = [
          { id = "WallpaperSelector"; }
          { id = "NoctaliaPerformance"; }
          { id = "Network"; }
        ];
        right = [
          { id = "Notifications"; }
          { id = "PowerProfile"; }
          { id = "KeepAwake"; }
          { id = "NightLight"; }
          { id = "Bluetooth"; }
        ];
      };
      cards = [
        {
          enabled = true;
          id = "profile-card";
        }
        {
          enabled = true;
          id = "shortcuts-card";
        }
        {
          enabled = true;
          id = "audio-card";
        }
        {
          enabled = false;
          id = "brightness-card";
        }
        {
          enabled = true;
          id = "weather-card";
        }
        {
          enabled = true;
          id = "media-sysmon-card";
        }
      ];
    };
    systemMonitor = {
      cpuWarningThreshold = 75;
      cpuCriticalThreshold = 95;
      tempWarningThreshold = 75;
      tempCriticalThreshold = 90;
      gpuWarningThreshold = 75;
      gpuCriticalThreshold = 90;
      memWarningThreshold = 75;
      memCriticalThreshold = 90;
      swapWarningThreshold = 75;
      swapCriticalThreshold = 90;
      diskWarningThreshold = 75;
      diskCriticalThreshold = 90;
      diskAvailWarningThreshold = 20;
      diskAvailCriticalThreshold = 10;
      batteryWarningThreshold = 20;
      batteryCriticalThreshold = 5;
      enableDgpuMonitoring = true;
      useCustomColors = true;
      warningColor = "#ff9800";
      criticalColor = "#ff1a15";
      externalMonitor = "wezterm -e btop";
    };
    noctaliaPerformance = {
      disableWallpaper = false;
      disableDesktopWidgets = true;
    };
    dock = {
      enabled = false;
      position = "bottom";
      displayMode = "auto_hide";
      dockType = "floating";
      backgroundOpacity = 1;
      floatingRatio = 1;
      size = 1;
      onlySameOutput = true;
      monitors = [ ];
      pinnedApps = [ ];
      colorizeIcons = false;
      showLauncherIcon = false;
      launcherPosition = "end";
      launcherUseDistroLogo = false;
      launcherIcon = "";
      launcherIconColor = "none";
      pinnedStatic = false;
      inactiveIndicators = false;
      groupApps = false;
      groupContextMenuMode = "extended";
      groupClickAction = "cycle";
      groupIndicatorStyle = "dots";
      deadOpacity = 0.6;
      animationSpeed = 1;
      sitOnFrame = false;
      showDockIndicator = false;
      indicatorThickness = 3;
      indicatorColor = "primary";
      indicatorOpacity = 0.6;
    };
    network = {
      bluetoothRssiPollingEnabled = false;
      bluetoothRssiPollIntervalMs = 60000;
      networkPanelView = "wifi";
      wifiDetailsViewMode = "grid";
      bluetoothDetailsViewMode = "grid";
      bluetoothHideUnnamedDevices = false;
      disableDiscoverability = true;
      bluetoothAutoConnect = true;
    };
    sessionMenu = {
      enableCountdown = false;
      countdownDuration = 10000;
      position = "center";
      showHeader = true;
      showKeybinds = true;

      largeButtonsStyle = true;
      largeButtonsLayout = "single-row";
      powerOptions = [
        {
          action = "lock";
          command = "";
          countdownEnabled = true;
          enabled = true;
          keybind = "1";
        }
        {
          action = "suspend";
          command = "";
          countdownEnabled = true;
          enabled = true;
          keybind = "2";
        }
        {
          action = "hibernate";
          command = "";
          countdownEnabled = true;
          enabled = false;
          keybind = "";
        }
        {
          action = "reboot";
          command = "";
          countdownEnabled = true;
          enabled = true;
          keybind = "3";
        }
        {
          action = "logout";
          command = "";
          countdownEnabled = true;
          enabled = false;
          keybind = "";
        }
        {
          action = "shutdown";
          command = "";
          countdownEnabled = true;
          enabled = true;
          keybind = "4";
        }
        {
          action = "rebootToUefi";
          command = "";
          countdownEnabled = true;
          enabled = false;
          keybind = "";
        }
        {
          action = "userspaceReboot";
          command = "";
          countdownEnabled = true;
          enabled = false;
          keybind = "";
        }
      ];
    };
    notifications = {
      enabled = true;
      enableMarkdown = false;
      density = "default";
      monitors = [
        "eDP-1"
        "HDMI-A-1"
      ];
      location = "top_right";
      overlayLayer = true;
      backgroundOpacity = 1;
      respectExpireTimeout = false;
      lowUrgencyDuration = 3;
      normalUrgencyDuration = 3;
      criticalUrgencyDuration = 5;
      clearDismissed = true;
      saveToHistory = {
        low = true;
        normal = true;
        critical = true;
      };
      sounds = {
        enabled = false;
        volume = 0.5;
        separateSounds = false;
        criticalSoundFile = "";
        normalSoundFile = "";
        lowSoundFile = "";
        excludedApps = "discord,firefox,chrome,chromium,edge";
      };
      enableMediaToast = false;
      enableKeyboardLayoutToast = true;
      enableBatteryToast = true;
    };
    osd = {
      enabled = true;
      location = "top_right";
      autoHideMs = 2000;
      overlayLayer = true;
      backgroundOpacity = 1;
      enabledTypes = [
        0
        1
        2
      ];
      monitors = [ ];
    };
    audio = {
      volumeStep = 5;
      volumeOverdrive = true;
      spectrumFrameRate = 30;
      visualizerType = "wave";
      spectrumMirrored = true;
      mprisBlacklist = [ ];
      preferredPlayer = "";
      volumeFeedback = false;
      volumeFeedbackSoundFile = "";
    };
    brightness = {
      brightnessStep = 5;
      enforceMinimum = true;
      enableDdcSupport = false;
      backlightDeviceMappings = [ ];
    };
    colorSchemes = {
      useWallpaperColors = false;
      predefinedScheme = "Lilac AMOLED";
      darkMode = true;
      schedulingMode = "off";
      manualSunrise = "06:30";
      manualSunset = "18:30";
      generationMethod = "tonal-spot";
      monitorForColors = "";
      syncGsettings = true;
    };
    templates = {
      activeTemplates = [ ];
      enableUserTheming = false;
    };
    nightLight = {
      enabled = true;
      forced = false;
      autoSchedule = true;
      nightTemp = "5000";
      dayTemp = "6500";
      manualSunrise = "06:30";
      manualSunset = "18:30";
    };
    hooks = {
      enabled = false;
      wallpaperChange = "";
      darkModeChange = "";
      screenLock = "";
      screenUnlock = "";
      performanceModeEnabled = "";
      performanceModeDisabled = "";
      startup = "";
      session = "";
      colorGeneration = "";
    };
    plugins = {
      autoUpdate = true;
      notifyUpdates = true;
    };
    idle = {
      enabled = true;
      screenOffTimeout = 300;
      lockTimeout = 300;
      suspendTimeout = 1800;
      fadeDuration = 5;
      screenOffCommand = "";
      lockCommand = "";
      suspendCommand = "";
      resumeScreenOffCommand = "";
      resumeLockCommand = "";
      resumeSuspendCommand = "";
      customCommands = "[]";
    };
    desktopWidgets = {
      enabled = false;
      overviewEnabled = true;
      gridSnap = false;
      gridSnapScale = false;
      monitorWidgets = [ ];
    };
  };
}
