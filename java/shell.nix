# shell.nix

{pkgs ? import <nixpkgs> { } }:
  
  pkgs.mkShell {
    
    nativeBuildInputs = with pkgs; [
      jdk
      maven
      spring-boot-cli
    ];

    shellHook = ''
      echo "---Development Environment Activated---"
      echo
      echo "[Dependencies]"
      echo "├─(Java)───────> $(java --version | head -n 1)"
      echo "├─(Maven)──────> $(mvn --version | head -n 1)"
      echo "└─(Spring CLI)─> $(spring --version)"
      echo
    '';

    # VARIABLE = "VALUE";
    # FILE = import ./something-else.nix
  }