<div align="center">
    <img src="../../assets/neovim-flake-logo.svg" alt="neovim-flake Logo"  width="200">
</div> 
#  Snippet Expansion and Completion Setup in NixVim

This configuration integrates `luasnip` (a Lua-based snippet engine) with `nvim-cmp` (a completion engine) and `nvim-lspconfig` (LSP support), all managed through Nix using `nixvim`.

---

##  Purpose

- Use LSP features for intelligent autocompletion.
- Expand snippets within the completion menu or manually.
- Navigate and jump through snippet placeholders.
- Customize popup borders and highlight groups for visual consistency.

---

##  Plugin Integration Summary

| Plugin         | Purpose                             |
| -------------- | ----------------------------------- |
| `nvim-cmp`     | Completion menu engine              |
| `cmp-nvim-lsp` | Source for LSP-based completion     |
| `cmp-path`     | File path completion                |
| `cmp-buffer`   | Text completion from current buffer |
| `cmp_luasnip`  | Completion source for LuaSnip       |
| `luasnip`      | Snippet engine                      |

---

##  Configuration Details

###  Completion Sources (`cmp.settings.sources`)

The following sources are configured:

````nix
sources = [
  { name = "nvim_lsp"; }   # LSP suggestions
  { name = "path"; }       # File paths
  { name = "buffer"; }     # Buffer content
  { name = "luasnip"; }    # LuaSnip snippet suggestions
];
---
##  Snippet Expansion Setup
This tells nvim-cmp to use LuaSnip as its snippet engine:
```nix
snippet = {
  expand = "function(args) require('luasnip').lsp_expand(args.body) end";
};
````

- When a completion item includes a snippet body (like an LSP function template), this function expands it using LuaSnip.
