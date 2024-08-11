# Beware the symbolic links! (Resolve them before using)
- All `**/.envrc` files are symbolic links of `/.envrc`
- All `/<env>/passthrough-flake/shell.nix` files are synbolic links of `/<env>/shell.nix`
- All `/<env>/passthrough-flake/flake.nix` files are synbolic links of `/passthrough.flake.nix`

# Suggested Usage
Use `cp -rL` to resolve the symbolic links into their respective files when copying.
