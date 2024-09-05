# shell.nix

{pkgs ? import <nixpkgs> { } }:
  
  pkgs.mkShell {
    
    nativeBuildInputs = with pkgs; [
      zig
    ];

    shellHook = ''
      echo "---Development Environment Activated---"
      echo
      echo "[Dependencies]"
      echo "└─(Zig)──────> $(zig version)"
      echo
    '';

    # VARIABLE = "VALUE";
    # FILE = import ./something-else.nix
  }