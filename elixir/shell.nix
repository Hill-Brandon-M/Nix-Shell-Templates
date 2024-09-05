# shell.nix

{pkgs ? import <nixpkgs> { } }:
  
  pkgs.mkShell {
    
    nativeBuildInputs = with pkgs; [
      elixir
    ];

    shellHook = ''
      echo "---Development Environment Activated---"
      echo
      echo "[Dependencies]"
      echo "└─(Elixir)───────> $(elixir --version)"
    '';

    # VARIABLE = "VALUE";
    # FILE = import ./something-else.nix
  }