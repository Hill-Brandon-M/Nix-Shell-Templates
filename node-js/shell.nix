# shell.nix

{pkgs ? import <nixpkgs> { } }:
  
  pkgs.mkShell {
    
    nativeBuildInputs = with pkgs; [
      nodejs_22
      deno
      bun
    ];

    shellHook = ''
      echo "---Development Environment Activated---"
      echo
      echo "[Dependencies]"
      echo "├─(NodeJS)──> $(node --version)"
      echo "├─(Deno)────> $(deno --version)"
      echo "└─(Bun)─────> $(bun --version)"
      echo
    '';

    # VARIABLE = "VALUE";
    # FILE = import ./something-else.nix
  }