{
  lib,
  ...
}:
{
  enable = true;

  enableBashIntegration = true;

  settings = {
    color_scheme = "iTerm2 Default";
    automatically_reload_config = true;
    audible_bell = "Disabled";

    font = lib.generators.mkLuaInline "wezterm.font({ family = 'MesloLGS Nerd Font', weight = 'Medium'})";
    font_size = 10;

    enable_scroll_bar = true;
    scrollback_lines = 65535;

    hide_tab_bar_if_only_one_tab = true;
    show_close_tab_button_in_tabs = false;
    show_new_tab_button_in_tab_bar = false;
    show_tabs_in_tab_bar = true;
    use_fancy_tab_bar = false;
    tab_max_width = 32;

    window_background_opacity = 0.8;
    max_fps = 60;

    colors = {
      tab_bar = {
        inactive_tab_edge = "none";
        background = "none";
      };
    };

    window_padding = {
      left = 4;
      right = 4;
      top = 4;
      bottom = 4;
    };

    window_frame = {
      font = lib.generators.mkLuaInline "wezterm.font({ family = 'MesloLGS Nerd Font', weight = 'Medium'})";
      font_size = 10;
      inactive_titlebar_bg = "none";
      active_titlebar_bg = "none";
    };

    keys = lib.generators.mkLuaInline ''
      {
        {
          key = "|",
          mods = "CTRL|SHIFT|ALT",
          action = wezterm.action.SplitPane {
            direction = "Right",
            size = { Percent = 50 },
          },
        },
        {
          key = "_",
          mods = "CTRL|SHIFT|ALT",
          action = wezterm.action.SplitPane {
            direction = "Down",
            size = { Percent = 50 },
          },
        },
      }'';
  };

  # NOTE: `wezterm` and `config` are defined by home manager
  extraConfig = ''
    wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
      local tab_style = {}

      local is_first_tab = tab.tab_index == 0
      local is_last_tab = tab.tab_index == (#tabs - 1)

      local background = "#2d1040"
      local foreground = "#bbbbbb"
      if tab.is_active then
        background = "#8a2be2"
        foreground = "#000000"

        if not is_first_tab then
          table.insert(tab_style, { Background = { Color = "#8a2be2" } })
          table.insert(tab_style, { Foreground = { Color = "#2d1040" } })
          table.insert(tab_style, { Text = wezterm.nerdfonts.pl_left_hard_divider })
        end
      end

      table.insert(tab_style, { Background = { Color = background } })
      table.insert(tab_style, { Foreground = { Color = foreground } })
      table.insert(tab_style, { Text = " " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. " " })

      local next_tab = tabs[tab.tab_index + 2] -- Fuck Lua and its Base-1 indexing
      local is_next_tab_active = next_tab and next_tab.is_active or false
      if not tab.is_active and not is_last_tab and not is_next_tab_active then
        table.insert(tab_style, { Background = { Color = background } })
        table.insert(tab_style, { Foreground = { Color = foreground } })
        table.insert(tab_style, { Text = wezterm.nerdfonts.pl_left_soft_divider })
      end

      if tab.is_active then
        table.insert(tab_style, { Foreground = { Color = "#8a2be2" } })
        table.insert(tab_style, { Background = { Color = (is_last_tab and "none" or "#2d1040") } })
        table.insert(tab_style, { Text = wezterm.nerdfonts.pl_left_hard_divider })
      elseif is_last_tab then
        table.insert(tab_style, { Background = { Color = "none" } })
        table.insert(tab_style, { Foreground = { Color = "#2d1040" } })
        table.insert(tab_style, { Text = wezterm.nerdfonts.pl_left_hard_divider })
      end

      return tab_style
    end)
  '';
}
