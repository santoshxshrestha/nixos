# NixOS Configuration

> [!NOTE]
> the reason that the config for the zsh is in the configuration.nix is below
> Home Manager only configures applications for your user - it doesn't have permission to change system-level settings like your login shell. When you log in, the system looks at /etc/passwd (or equivalent) to determine which shell to start, and Home Manager can't modify that.

---

Notes: Running Clangd LSP on NixOS and nix-ld
Problem:
On NixOS, running clangd (C/C++ language server) via Neovim LSP causes error:
Could not start dynamically linked executable: clangd
NixOS cannot run dynamically linked executables intended for generic
linux environments out of the box.
This happens because NixOS uses isolated, non-standard library paths.
clangd expects normal Linux dynamic linker and libraries, which NixOS doesn’t provide by default.

Why it happens:
NixOS separates system dependencies strictly.
Dynamically linked executables rely on runtime shared libraries in fixed paths (/lib, /usr/lib), but NixOS stores libraries in isolated /nix/store paths.
Without extra support, these executables fail to find needed libraries and fail to run.

How to fix it:
Enable nix-ld:
nix-ld provides a dynamic loader shim that intercepts calls and sets up an environment so dynamically linked binaries can find their libraries correctly.
This is the simplest fix for unpackaged binaries that don’t come from Nix packages.

Example config snippet in configuration.nix:

```nix
{
programs.nix-ld.enable = true;

programs.nix-ld.libraries = with pkgs; [
clang-tools # clangd and related libs

# Add other libs if needed

];
}
Rebuild system: sudo nixos-rebuild switch
After this, running clangd (and other similar binaries) works correctly.

```
