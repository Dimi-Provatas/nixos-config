{
  pkgs,
  ...
}:
{
  ".config/menus/applications.menu".text =
    builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  ".config/Code/User/settings.json".source = ./vscode.json;
  ".config/pulsemixer.cfg".source = ./pulsemixer.cfg;

  ".config/gtk-3.0/gtk-main.css".source = ./gtk-3.css;
  ".config/gtk-4.0/gtk-main.css".source = ./gtk-4.css;
  ".config/qt5ct/colors/qt5ct.conf".source = ./qt-5.conf;
  ".config/qt6ct/colors/qt6ct.conf".source = ./qt-6.conf;

  ".config/QtProject.conf".source = ./QtProject.conf;
  ".config/baloofileinformationrc".source = ./baloofileinformationrc;
  ".config/dolphinrc".source = ./dolphinrc;
  ".config/filetypesrc".source = ./filetypesrc;
  ".config/gwenviewrc".source = ./gwenviewrc;
  ".config/kate-externaltoolspluginrc".source = ./kate-externaltoolspluginrc;
  ".config/katerc".source = ./katerc;
  ".config/katevirc".source = ./katevirc;
  ".config/kcalcrc".source = ./kcalcrc;
  ".config/kdeglobals".source = ./kdeglobals;
  ".config/kdfrc".source = ./kdfrc;
  ".config/kiorc".source = ./kiorc;
  ".config/kservicemenurc".source = ./kservicemenurc;
  ".config/ktrashrc".source = ./ktrashrc;
  ".config/okularpartrc".source = ./okularpartrc;
  ".config/okularrc".source = ./okularrc;
}
