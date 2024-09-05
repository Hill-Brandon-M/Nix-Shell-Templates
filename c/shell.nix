# shell.nix

{pkgs ? import <nixpkgs> { } }:
  
  pkgs.mkShell {
    
    nativeBuildInputs = with pkgs; [
      libgcc
      gnumake
    ];

    shellHook = ''
      echo "---Development Environment Activated---"
      echo
      echo "[Dependencies]"
      echo "├─(GCC)───> $(gcc --version)"
      echo "└─(Make)──> $(make --version)"
      echo
    '';

    # VARIABLE = "VALUE";
    # FILE = import ./something-else.nix
  }