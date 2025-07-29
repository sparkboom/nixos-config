pkgs:{
  enable = true;
  userName = "Matthew McLeod";
  userEmail = "matt@sparkboom.com";
  extraConfig = {
    push.autoSetupRemote = true;
    # TODO: consider using pkgs
    core.editor = "/Applications/Visual Studio Code - Insiders.app/Contents/MacOS/Electron";
    web.browser = "google-chrome";
  };
}