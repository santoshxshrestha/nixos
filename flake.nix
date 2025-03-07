{
  description = "Reproducible Dev Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    neovim-config = {
      # make the reop public for clone 
      url = "https://github.com/SantoshShrestha11/dotfiles";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, neovim-config }: {
    devShells.default = nixpkgs.legacyPackages.x86_64-linux.mkShell {
      buildInputs = [
        nixpkgs.nodejs_23
        nixpkgs.neovim
        nixpkgs.git
        nixpkgs.curl
        nixpkgs.wget
      ];

      shellHook = ''
        echo "Setting up global npm packages..."

        # forwarding the auth keys I don't want to push from this env so commenting it out
        # export SSH_AUTH_SOCK=$SSH_AUTH_SOCK

        export NODE_PATH="/usr/lib/node_modules"
        export PATH="$NODE_PATH/.bin:$PATH"

        mkdir -p "$NODE_PATH"

        npm install -g --prefix=/usr/lib corepack@0.31.0 live-server@1.2.2 \
          node-gyp@11.1.0 nopt@7.2.1 npm@11.1.0 semver@7.7.1 sql-language-server@1.7.1
        echo "cloning Neovim config ..."

        echo "Linking Neovim config..."

        mkdir -p $HOME/nix-nvim
        # deleting the existing config file to reduce the conflicts
        rm -rf ~/nix-nvim/.config/nvim

        # here the line below will just creates the seam link but not download the whole directory
        ln -s ${neovim-config}/nvim/.config/nvim $HOME/nix-nvim/.config/nvim

        export XDG_CONFIG_HOME="$HOME/nix-nvim/.config"
        echo "Development environment ready!"
      '';
    };
  };
}

