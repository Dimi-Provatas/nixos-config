{
  ".config/tealdeer/config.toml".text = ''
    [display]
    use_pager = true
    show_title = true

    [updates]
    auto_update = true
    auto_update_interval_hours = 24
  '';

  "config/btop/btop.conf".source = ./btop.conf;
}
