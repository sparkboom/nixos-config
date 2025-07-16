{
  enable = true;
  userName = "Matthew McLeod";
  userEmail = "matt@sparkboom.com";
  extraConfig = {
    push.autoSetupRemote = true;
    core.editor = "/Applications/Visual Studio Code - Insiders.app/Contents/MacOS/Electron";
    diff.tool = "/Applications/Kaleidoscope.app/Contents/MacOS/Kaleidoscope";
    merge.tool = "/Applications/Kaleidoscope.app/Contents/MacOS/Kaleidoscope";
    mergetool.prompt = false;
    mergetool.Kaleidoscope.cmd = "ksdiff --merge --output \"$MERGED\" --base \"$BASE\" -- \"$LOCAL\" --snapshot \"$REMOTE\" --snapshot";
    mergetool.Kaleidoscope.trustexitcode = true;
    difftool.Kaleidoscope.cmd = "ksdiff --partial-changeset --relative-path \"$MERGED\" -- \"$LOCAL\" \"$REMOTE\"";
    difftool.prompt = false;
    web.browser = "google-chrome";
  };
}