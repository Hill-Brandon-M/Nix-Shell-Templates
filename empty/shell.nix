# shell.nix

{pkgs ? import <nixpkgs> { } }:
  
  pkgs.mkShell {
    
    nativeBuildInputs = with pkgs; [
      # ...
    ];

    shellHook = ''
      # ...
      echo "Hello, Shell World!"
      echo
    '';

    # VARIABLE = "VALUE";
    # FILE = import ./something-else.nix
  }