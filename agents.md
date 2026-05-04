# Agents

## Purpose
- Track the MNW migration from nixvim
- Keep module parity and known gaps in one place

## Scope
- Home Manager wiring
- MNW init + plugin setup
- LSP, completion, formatter, UI, and keymaps

## Checklist
- [ ] MNW module enabled in `homes/santosh/home.nix`
- [ ] init.lua created in `homes/santosh/modes/mnw/init.lua`
- [ ] plugin list matches nixvim set
- [ ] LSP server parity checked
- [ ] formatting sources verified
- [ ] home-manager switch tested

## Notes
- MNW config lives under `homes/santosh/modes/mnw`
- nixvim modules remain for reference during migration
