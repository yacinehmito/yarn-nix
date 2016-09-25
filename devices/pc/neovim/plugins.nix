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
}
