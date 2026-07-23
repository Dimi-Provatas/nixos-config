{
  enable = true;

  theme = "iterm";

  settings = {
    cursor = {
      blink_timeout = 1;
      blink_interval = 500;

      style = {
        blinking = "Always";
        shape = "Beam";
      };
    };

    font = {
      size = 9;

      bold = {
        family = "MesloLGS Nerd Font";
        style = "Bold";
      };
      bold_italic = {
        family = "MesloLGS Nerd Font";
        style = "Bold Italic";
      };
      italic = {
        family = "MesloLGS Nerd Font";
        style = "Italic";
      };
      normal = {
        family = "MesloLGS Nerd Font";
        style = "Regular";
      };
    };

    terminal.shell = "fish";

    window = {
      opacity = 0.9;
      padding = {
        x = 4;
        y = 4;
      };
    };
  };
}
