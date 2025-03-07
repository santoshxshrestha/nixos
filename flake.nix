{
  description = "Reproducible Dev Environment";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";  # Changed to unstable
      flake = true;
    };
    neovim-config = {
      url = "https://github.com/SantoshShrestha11/dotfiles";
      flake = false;
    };
  };
  outputs = { self, nixpkgs, neovim-config }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.nodejs_23  # Now using nodejs 23 from unstable
          pkgs.neovim
          pkgs.git
          pkgs.curl
          pkgs.wget
        ];
        shellHook = ''
          echo "Setting up global npm packages..."
          export NPM_CONFIG_PREFIX="$HOME/.npm-global"
          mkdir -p "$NPM_CONFIG_PREFIX"
          export PATH="$NPM_CONFIG_PREFIX/bin:$PATH"
          npm install -g corepack@0.31.0 live-server@1.2.2 \
          node-gyp@11.1.0 nopt@7.2.1 npm@11.1.0 semver@7.7.1 sql-language-server@1.7.1
          echo "Inspecting neovim-config structure:"
          ls -la ${neovim-config}
  ls -la ${neovim-config}/nvim || echo "nvim directory not found"

  mkdir -p $HOME/Nix/.config
  rm -rf $HOME/Nix/.config/nvim

  # Try direct path if the structure is different
  if [ -d "${neovim-config}/nvim/.config/nvim" ]; then
  ln -s ${neovim-config}/nvim/.config/nvim $HOME/Nix/.config/nvim
  elif [ -d "${neovim-config}/.config/nvim" ]; then
  ln -s ${neovim-config}/.config/nvim $HOME/Nix/.config/nvim
  elif [ -d "${neovim-config}/nvim" ]; then
  ln -s ${neovim-config}/nvim $HOME/Nix/.config/nvim
  else
  echo "ERROR: Could not find neovim config in expected locations"
  ls -R ${neovim-config}
  fi          export XDG_CONFIG_HOME="$HOME/Nix/.config"
  echo "Development environment ready!"
  '';
      };
    };
}
