{
  "Print".action.spawn-sh = "slurp | grim -g - - | wl-copy";

  # "Alt+Return".action.spawn = "alacritty";
  "Alt+Return".action.spawn = "wezterm";
  "Alt+Space".action.spawn = [
    "noctalia-shell"
    "ipc"
    "call"
    "launcher"
    "toggle"
  ];
  # "Alt+Tab".action.next-window = { scope = "output"; };
  # "Alt+Shift+Tab".action.previous-window = { scope = "output"; };

  "Mod+Shift+P".action.spawn = [
    "noctalia-shell"
    "ipc"
    "call"
    "sessionMenu"
    "lockAndSuspend"
  ];
  "Mod+Shift+Q".action.close-window = { };

  "Mod+Ctrl+Alt+L".action.spawn = [
    "noctalia-shell"
    "ipc"
    "call"
    "lockScreen"
    "lock"
  ];

  "Mod+Shift+Left".action.focus-monitor-left = { };
  "Mod+Shift+Down".action.focus-monitor-down = { };
  "Mod+Shift+Up".action.focus-monitor-up = { };
  "Mod+Shift+Right".action.focus-monitor-right = { };
  "Mod+Shift+H".action.focus-monitor-left = { };
  "Mod+Shift+J".action.focus-monitor-down = { };
  "Mod+Shift+K".action.focus-monitor-up = { };
  "Mod+Shift+L".action.focus-monitor-right = { };

  "Mod+O".action.spawn = [
    "niri"
    "msg"
    "action"
    "toggle-overview"
  ];
  "Mod+E".action.spawn = "dolphin";
  "Mod+M".action.maximize-column = { };
  "Mod+F".action.toggle-window-floating = { };
  "Mod+R".action.switch-preset-column-width = { };
  "Mod+Home".action.focus-column-first = { };
  "Mod+End".action.focus-column-last = { };
  "Mod+Space".action.spawn = [
    "niri"
    "msg"
    "action"
    "switch-layout"
    "next"
  ];

  "Mod+Left".action.focus-column-left = { };
  "Mod+Down".action.focus-window-down = { };
  "Mod+Up".action.focus-window-up = { };
  "Mod+Right".action.focus-column-right = { };
  "Mod+H".action.focus-column-left = { };
  "Mod+J".action.focus-window-down = { };
  "Mod+K".action.focus-window-up = { };
  "Mod+L".action.focus-column-right = { };

  "Mod+U".action.focus-workspace-down = { };
  "Mod+I".action.focus-workspace-up = { };
  "Mod+Page_Down".action.focus-workspace-down = { };
  "Mod+Page_Up".action.focus-workspace-up = { };

  "XF86AudioRaiseVolume".action.spawn = [
    "wpctl"
    "set-volume"
    "@DEFAULT_AUDIO_SINK@"
    "0.05+"
  ];
  "XF86AudioLowerVolume".action.spawn = [
    "wpctl"
    "set-volume"
    "@DEFAULT_AUDIO_SINK@"
    "0.05-"
  ];
  "XF86AudioMute".action.spawn = [
    "noctalia-shell"
    "ipc"
    "call"
    "mic_mute"
  ];
  "XF86AudioMicMute".action.spawn = [
    "noctalia-shell"
    "ipc"
    "call"
    "volume"
    "muteInput"
  ];

  "XF86MonBrightnessDown".action.spawn = [
    "noctalia-shell"
    "ipc"
    "call"
    "brightness"
    "increase"
  ];
  "XF86MonBrightnessUp".action.spawn = [
    "noctalia-shell"
    "ipc"
    "call"
    "brightness"
    "decrease"
  ];

  "XF86AudioPlay".action.spawn = [
    "noctalia-shell"
    "ipc"
    "call"
    "media"
    "playPause"
  ];
  "XF86AudioNext".action.spawn = [
    "noctalia-shell"
    "ipc"
    "call"
    "media"
    "next"
  ];
  "XF86AudioPrev".action.spawn = [
    "noctalia-shell"
    "ipc"
    "call"
    "media"
    "previous"
  ];

  "XF86RFKill".action.spawn = [
    "noctalia-shell"
    "ipc"
    "call"
    "airplaneMode"
    "toggle"
  ];
  "XF86Calculator".action.spawn = "kcalc";

  "Mod+Ctrl+Left".action.move-column-left = { };
  "Mod+Ctrl+Down".action.move-window-down = { };
  "Mod+Ctrl+Up".action.move-window-up = { };
  "Mod+Ctrl+Right".action.move-column-right = { };
  "Mod+Ctrl+H".action.move-column-left = { };
  "Mod+Ctrl+J".action.move-window-down = { };
  "Mod+Ctrl+K".action.move-window-up = { };
  "Mod+Ctrl+L".action.move-column-right = { };

  "Mod+Ctrl+Home".action.move-column-to-first = { };
  "Mod+Ctrl+End".action.move-column-to-last = { };

  "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = { };
  "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = { };
  "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = { };
  "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = { };
  "Mod+Shift+Ctrl+H".action.move-column-to-monitor-left = { };
  "Mod+Shift+Ctrl+J".action.move-column-to-monitor-down = { };
  "Mod+Shift+Ctrl+K".action.move-column-to-monitor-up = { };
  "Mod+Shift+Ctrl+L".action.move-column-to-monitor-right = { };
  "Mod+Ctrl+Page_Down".action.move-column-to-workspace-down = { };
  "Mod+Ctrl+Page_Up".action.move-column-to-workspace-up = { };
  "Mod+Ctrl+U".action.move-column-to-workspace-down = { };
  "Mod+Ctrl+I".action.move-column-to-workspace-up = { };
  "Mod+Shift+Page_Down".action.move-workspace-down = { };
  "Mod+Shift+Page_Up".action.move-workspace-up = { };
  "Mod+Shift+U".action.move-workspace-down = { };
  "Mod+Shift+I".action.move-workspace-up = { };

  "Mod+1".action.focus-workspace = 1;
  "Mod+2".action.focus-workspace = 2;
  "Mod+3".action.focus-workspace = 3;
  "Mod+4".action.focus-workspace = 4;
  "Mod+5".action.focus-workspace = 5;
  "Mod+6".action.focus-workspace = 6;
  "Mod+7".action.focus-workspace = 7;
  "Mod+8".action.focus-workspace = 8;
  "Mod+9".action.focus-workspace = 9;
  "Mod+0".action.focus-workspace = 0;

  "Mod+Ctrl+1".action.move-column-to-workspace = 1;
  "Mod+Ctrl+2".action.move-column-to-workspace = 2;
  "Mod+Ctrl+3".action.move-column-to-workspace = 3;
  "Mod+Ctrl+4".action.move-column-to-workspace = 4;
  "Mod+Ctrl+5".action.move-column-to-workspace = 5;
  "Mod+Ctrl+6".action.move-column-to-workspace = 6;
  "Mod+Ctrl+7".action.move-column-to-workspace = 7;
  "Mod+Ctrl+8".action.move-column-to-workspace = 8;
  "Mod+Ctrl+9".action.move-column-to-workspace = 9;
  "Mod+Ctrl+0".action.move-column-to-workspace = 0;

  "Mod+Ctrl+Shift+E".action.quit = { };

  "Mod+Minus".action.set-column-width = "-10%";
  "Mod+Equal".action.set-column-width = "+10%";
}
