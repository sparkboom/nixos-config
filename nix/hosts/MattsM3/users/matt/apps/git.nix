{pkgs, lib}:
let 
  git-config = import ../../../../../apps/git/config.nix { inherit pkgs; };
in
lib.recursiveUpdate git-config {
  extraConfig = {
    credential.helper = "osxkeychain";
    diff.tool = "/Applications/Kaleidoscope.app/Contents/MacOS/Kaleidoscope";
    difftool.prompt = false;
    difftool.Kaleidoscope.cmd = "ksdiff --partial-changeset --relative-path \"$MERGED\" -- \"$LOCAL\" \"$REMOTE\"";
    merge.tool = "/Applications/Kaleidoscope.app/Contents/MacOS/Kaleidoscope";
    mergetool.prompt = false;
    mergetool.Kaleidoscope.cmd = "ksdiff --merge --output \"$MERGED\" --base \"$BASE\" -- \"$LOCAL\" --snapshot \"$REMOTE\" --snapshot";
    mergetool.Kaleidoscope.trustexitcode = true;
  };
}

