{
  config,
  ...
}:
{
  mime.enable = true;

  mimeApps = {
    enable = true;

    defaultApplications = {
      "application/pdf" = "okular.desktop";
      "application/zip" = "ark.desktop";
      "audio/mpeg" = "vlc.desktop";
      "image/jpeg" = "gwenview.desktop";
      "image/png" = "gwenview.desktop";
      "image/webp" = "gwenview.desktop";
      "text/html" = "firefox.desktop";
      "text/plain" = "kate.desktop";
      "video/mp4" = "gwenview.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };

  dataHome = "${config.home.homeDirectory}/.local/share";
  configHome = "${config.home.homeDirectory}/.config";

  configFile = {
    "mimeapps.list".text = ''
      [Default Applications]
      application/pdf=okular.desktop
      application/zip=ark.desktop
      audio/mpeg=vlc.desktop
      image/jpeg=gwenview.desktop
      image/png=gwenview.desktop
      image/webp=gwenview.desktop
      text/html=firefox.desktop
      text/plain=kate.desktop
      video/mp4=gwenview.desktop
      x-scheme-handler/about=firefox.desktop
      x-scheme-handler/http=firefox.desktop
      x-scheme-handler/https=firefox.desktop
      x-scheme-handler/unknown=firefox.desktop
    '';
  };
}
