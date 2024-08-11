# Beware the symbolic links! (Resolve them before using)
- All `**/.envrc` files are symbolic links of `/.envrc`
- All `/<env>/passthrough-flake/flake.nix` files are symbolic links of `/passthrough.flake.nix`
- All `/<env>/passthrough-flake/shell.nix` files are symbolic links of `/<env>/shell.nix`

# Suggested Usage
Use `cp -rL` to resolve the symbolic links into their respective files when copying.
