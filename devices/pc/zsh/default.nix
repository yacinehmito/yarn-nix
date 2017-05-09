# My user configuration.
{ config, pkgs, lib, ... }:

let
  readFile = builtins.readFile;
in
{
  environment.systemPackages = [
    pkgs.oh-my-zsh
  ];
  
  environment.sessionVariables = {
    TERMINFO_DIRS = "/run/current-system/sw/share/terminfo";
  };

  programs.zsh = {
    enable = true;
    shellInit = readFile ./init.zsh;
    interactiveShellInit = lib.concatStrings [
      ''
        export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh
        plugins=(git)
        source $ZSH/oh-my-zsh.sh
      ''
      (readFile ./interactive.zsh)
      ''
        eval "$zshHook"
      ''
    ];
    loginShellInit = readFile ./login.zsh;
    shellAliases = import ./aliases.nix;
    promptInit = readFile ./prompt.zsh;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    enableAutosuggestions = true;
  };
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";
}

