{ pkgs, ... }:
let
  gitSyncNotes = pkgs.writeScriptBin "git-sync-notes" ''
    #!/usr/bin/env bash

    VAULT_DIR="$HOME/notes"
    cd $VAULT_DIR || exit 1

    git add .
    git commit -m "$(date '+%Y-%m-%d %H:%M:%S')" || exit 0

    git pull --rebase origin main || exit 1
    git push origin main
  '';
in
{
  home.packages = [ gitSyncNotes ];

  systemd.user.services.git-sync-notes = {
    Unit = {
      Description = "Sync notes vault to github";
      Wants = "git-sync-notes.timer";
    };
    Service = {
      ExecStart = "${gitSyncNotes}/bin/git-sync-notes";
      Type = "simple";
    };
  };

  systemd.user.timers.git-sync-notes = {
    Timer.OnCalendar = "*:0/5";
    Unit.Description = "Timer for Sync notes vault to github unit";
    Install.WantedBy = [ "timers.target" ];
  };
}
