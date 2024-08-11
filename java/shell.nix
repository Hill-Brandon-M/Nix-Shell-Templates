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
      echo "├─(Java)───────> $(java --version)"
      echo "├─(Maven)──────> $(mvn --version)"
      echo "└─(Spring CLI)─> $(spring --version)"
    '';

    # VARIABLE = "VALUE";
    # FILE = import ./something-else.nix
  }