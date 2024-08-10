# shell.nix

{pkgs ? import <nixpkgs> { } }:
  
  pkgs.mkShell {
    
    nativeBuildInputs = with pkgs; [
      nodejs_22
    ];

    shellHook = ''
      echo '---Development Environment Activated---\n'
      echo "[Dependencies]"
      echo "└─(NodeJS)──> $(node --version)"
    '';

    # VARIABLE = "VALUE";
    # FILE = import ./something-else.nix
  }