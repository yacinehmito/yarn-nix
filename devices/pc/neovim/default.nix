{ lib, fetchFromGitHub, vimUtils, vimPlugins, neovim, editorconfig-core-c }:

let
  customPlugins = import ./plugins.nix {
    inherit fetchFromGitHub vimUtils;
  };
  
  localVimrc = ''
    if $XDG_CONFIG_HOME == ""
      let config = expand("$HOME/.config/nvim/init.vim")
    else
      let config = expand("$XDG_CONFIG_HOME/nvim/init.vim")
    endif
    if filereadable(config)
      exec "source " . config
    else
      echo "Could not read " . config
    endif
  '';

  editorConfigVimrc = ''
    let g:EditorConfig_exec_path = "${editorconfig-core-c}/bin/editorconfig"
    let g:EditorConfig_core_mode = "external_command"
  '';
in
neovim.override {
  withPython = true;
  extraPythonPackages = [];
  withPython3 = true;
  extraPython3Packages = [];
  withJemalloc = true;
  withPyGUI = false;
  vimAlias = false;
  configure = {
    vam = {
      knownPlugins = vimPlugins // customPlugins;
      pluginDictionaries = [
        # Cosmetic
        { name = "lightline-vim"; }
        { name = "colorizer"; }
        { name = "quick-scope"; }
        { name = "tender"; }

        # Integration
        { name = "fugitive"; }
        { name = "neomake"; }
        { name = "editorconfig-vim"; }

        # Ease of use
        { name = "commentary"; } # Use gcc to comment a line
        { name = "UltiSnips"; }
        { name = "surround"; } # Use gcc to comment a line
        { name = "visual-increment"; }
        { name = "vim-easy-align"; }
        { name = "delimitMate"; }

        # Language support
        { name = "vim-nix"; }
        { name = "elm-vim"; }
        { name = "idris-vim"; }
        { name = "vim-javascript"; }
        { name = "vim-jsx"; }
        { name = "typescript-vim"; }
      ];
    };
    customRC = builtins.readFile ./init.vim +
               builtins.readFile ./lightline.vim +
               builtins.readFile ./digraphs.vim +
               editorConfigVimrc +
               localVimrc;
  };
}
