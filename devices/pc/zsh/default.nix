# My user configuration.
{ config, pkgs, lib, ... }:

let
  readFile = builtins.readFile;
in
{
  environment.systemPackages = [
    pkgs.oh-my-zsh
  ];

  programs.zsh = {
    enable = true;
    shellInit = readFile ./init.zsh;
    interactiveShellInit = lib.concatStrings [
      ''
        export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh
        ZSH_THEME="fishy"
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
    promptInit = ""; # Avoid conflict with oh-my-zsh
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    enableAutosuggestions = true;
  };
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";
}

