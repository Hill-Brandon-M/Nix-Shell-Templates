# shell.nix

{pkgs ? import <nixpkgs> { } }:
  
  pkgs.mkShell {
    
    nativeBuildInputs = with pkgs; [
      texlive.combined.scheme-full
    ];

    shellHook = ''
      echo "---Development Environment Activated---"
      echo
      echo "[Dependencies]"
      echo "└─(TeX Live)───> $(tex --version)"
      echo
    '';

    # VARIABLE = "VALUE";
    # FILE = import ./something-else.nix
  }