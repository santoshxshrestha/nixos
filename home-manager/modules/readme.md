# Enabling `fzf.fish` in Fish Shell with Home Manager

This setup adds the [fzf.fish](https://github.com/patrickf1/fzf.fish) plugin to Fish shell using Home Manager. It provides fuzzy completion, command history search, and directory jumping.

## What is fzf.fish?

A plugin that brings `fzf`-powered features to Fish shell:

---

## ⚙️ Home Manager Configuration

Add the following block inside your `programs.fish.plugins` list:

```nix
{
  name = "fzf-fish";
  src = pkgs.fetchFromGitHub {
    owner = "PatrickF1";
    repo = "fzf.fish";
    rev = "v10.3";
    sha256 = "1hqqppna8iwjnm8135qdjbd093583qd2kbq8pj507zpb1wn9ihjg";
  };
}
```

## You can place this inside a module like modules/fish.nix or directly in home.nix, depending on your structure.

# How the sha256 was obtained

Used the `nix-prefetch-url` command to fetch the archive and generate the hash:

```fish
nix-prefetch-url --unpack https://github.com/PatrickF1/fzf.fish/archive/refs/tags/v10.3.tar.gz

```

This returned:

```fish
1hqqppna8iwjnm8135qdjbd093583qd2kbq8pj507zpb1wn9ihjg
```
