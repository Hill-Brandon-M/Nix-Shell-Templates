# shell.nix

{pkgs ? import <nixpkgs> { } }:
  
  pkgs.mkShell {
    
    nativeBuildInputs = with pkgs; [
      symlinks # For resolving relative paths
    ];

    shellHook = ''
      echo "---Nix-Shell Template Development Environment---"
      echo
    '';

    # VARIABLE = "VALUE";
    # FILE = import ./something-else.nix
  }