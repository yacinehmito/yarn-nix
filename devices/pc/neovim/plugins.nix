{ vimUtils, fetchFromGitHub }:

{
  colorizer = vimUtils.buildVimPluginFrom2Nix {
    name = "colorizer";
    src = fetchFromGitHub {
      repo = "colorizer";
      owner = "chrisbra";
      rev = "4e6846c73596a5f935bb7a3a2a76e2d3d9cbce18";
      sha256 = "0k63l84cw21y1a2ww90kcyzjp520nz62fnmqwz1x2b10ldapxg5j";
    };
  };
  quick-scope = vimUtils.buildVimPluginFrom2Nix {
    name = "quick-scope";
    src = fetchFromGitHub {
      repo = "quick-scope";
      owner = "unblevable";
      rev = "d5882cb0e8e01494b7c2d2058cf5c9427bc6367b";
      sha256 = "1p8jbdx8p34v1af0cqyqz4aadpdmmj96mmwjxggi0kh7a7ajl5iw";
    };
  };
  delimitMate = vimUtils.buildVimPluginFrom2Nix {
    name = "delimitMate";
    src = fetchFromGitHub {
      repo = "delimitMate";
      owner = "Raimondi";
      rev = "b5719054beebe0135c94f4711a06dc7588041f09";
      sha256 = "03nmkiq138w6kq4s3mh4yyr6bjvqwj8hg6qlji1ng4vnzb0638q3";
    };
  };
  visual-increment = vimUtils.buildVimPluginFrom2Nix {
    name = "visual-increment";
    src = fetchFromGitHub {
      repo = "vim-visual-increment";
      owner = "triglav";
      rev = "e50e8f7c062cec759f665278eb58535df1611a23";
      sha256 = "1gd6mxp9y80wf7nxcm02104l54gqz5k3dgv1h98jl9a7q9swb8y6";
    };
  };
  tender = vimUtils.buildVimPluginFrom2Nix {
    name = "tender";
    src = fetchFromGitHub {
      repo = "tender";
      owner = "jacoborus";
      rev = "4decd6844ee692634b9ec3b89d05ad32c7698920";
      sha256 = "1n0p70r3bk6r23wpy6qg6glqlsn1dxwx7ccsq7i9wwyh1z13hdjx";
    };
  };
  vim-fish = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-fish";
    src = fetchFromGitHub {
      repo = "vim-fish";
      owner = "dag";
      rev = "825853f4816a07e59ea2ecee1190ab6a5d9ef991";
      sha256 = "1hn30j1pw55qkf7228dxh7w1j1ywb8nhzhfw74zg2sni9rkcmycc";
    };
  };
  intero-neovim-gpyh = vimUtils.buildVimPluginFrom2Nix {
    name = "intero-neovim-gpyh";
    src = fetchFromGitHub {
      repo = "intero-neovim";
      owner = "gpyh";
      rev = "93b9318503dd5314dce74fcc5b83b7585eab2e5d";
      sha256 = "1d8rxkyqg09mnk8mh943zc85jqrnzdgdvbqnzih4l5dyvzf1z96g";
    };
  };
  intero-neovim = vimUtils.buildVimPluginFrom2Nix {
    name = "intero-neovim";
    src = fetchFromGitHub {
      repo = "intero-neovim";
      owner = "parsonsmatt";
      rev = "113543022504364b0173f68b67141170c6aef0d1";
      sha256 = "1c15cnwcpvfy94rx3vcs5n8i7pyz1rr0h0gpic9iqsgxawvw8arr";
    };
  };
  ghcmod = vimUtils.buildVimPluginFrom2Nix { # created by nix#NixDerivation
    name = "ghcmod-2016-06-19";
    src = fetchFromGitHub {
      repo = "ghcmod-vim";
      owner = "eagletmt";
      rev = "1d192d13d68ab59f9f46497a0909bf24a7b7dfff";
      sha256 = "0bzahgzagnf0a9zv86jhdf8nc3p0yfz9izv5n3lc8gc12cp47d0a";
    };
    # dependencies = [ "vimproc-vim" ];
  };
  deoplete-nvim = vimUtils.buildVimPluginFrom2Nix { # created by nix#NixDerivation
    name = "deoplete-nvim-2016-10-29";
    src = fetchFromGitHub {
      repo = "deoplete.nvim";
      owner = "Shougo";
      rev = "56c34002ce1dae6e66040c8d3ed7517707c90ed1";
      sha256 = "075nzghxb274bcp67q2si1gy033vxy6165dn820pbsfd3bgpvv7j";
    };
    dependencies = [];
  };
  vim-jsx = vimUtils.buildVimPluginFrom2Nix { # created by nix#NixDerivation
    name = "vim-jsx-2016-08-23";
    src = fetchFromGitHub {
      repo = "vim-jsx";
      owner = "mxw";
      rev = "eb656ed96435ccf985668ebd7bb6ceb34b736213";
      sha256 = "1ydyifnfk5jfnyi4a1yc7g3b19aqi6ajddn12gjhi8v02z30vm65";
    };
    dependencies = [];
  };
  vim-javascript = vimUtils.buildVimPluginFrom2Nix { # created by nix#NixDerivation
    name = "vim-javascript-2017-01-12";
    src = fetchFromGitHub {
      repo = "vim-javascript";
      owner = "pangloss";
      rev = "f8e9c1a7f8b684c04aa13e9cfab3b2e7b87ac727";
      sha256 = "1njfrzih6p26bamzbh3cr7j6lgd9bxqzymbqn2a1l9ykflhng7kb";
    };
    dependencies = [];
  };
  neoterm = vimUtils.buildVimPluginFrom2Nix { # created by nix#NixDerivation
    name = "neoterm";
    src = fetchFromGitHub {
      repo = "neoterm";
      owner = "kassio";
      rev = "f94009146432d8ce8177b0ddfff7ce092fa8c8db";
      sha256 = "0n6hmc21cjgri2h6wf0w2328hyqh32kmg8bj371v5132nx6b8qdj";
    };
    dependencies = [];
  };
}
