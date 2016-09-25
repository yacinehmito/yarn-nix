# My user configuration.
{ config, pkgs, ... }:

let
  readFile = builtins.readFile;
in
{
  programs.zsh = {
    shellInit = readFile ./init.zsh;
    interactiveShellInit = readFile ./interactive.zsh;
    loginShellInit = readFile ./login.zsh;
    promptInit = readFile ./prompt.zsh;
    shellAliases = import ./aliases.nix;
    enableCompletion = true;
    enable = true;
  };
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";
}

