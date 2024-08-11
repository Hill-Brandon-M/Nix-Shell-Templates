# shell.nix

{pkgs ? import <nixpkgs> { } }:
  
  pkgs.mkShell {
    
    nativeBuildInputs = with pkgs; [
      libgcc
      gnumake
    ];

    shellHook = ''
      echo '---Development Environment Activated---\n'
      echo "[Dependencies]"
      echo "├─(GCC)───> $(gcc --version)"
      echo "└─(Make)──> $(make --version)"
    '';

    # VARIABLE = "VALUE";
    # FILE = import ./something-else.nix
  }