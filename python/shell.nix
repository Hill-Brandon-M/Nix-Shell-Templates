# shell.nix

{pkgs ? import <nixpkgs> { } }:
  
  pkgs.mkShell {
    
    packages = with pkgs; [
      (python3.withPackages (python-pkgs: with python-pkgs; [
        # Add packages here

        # numpy
        # scipy
        # matplotlib
        # scikit-learn
        # jupyter
        # pandas
        # requests
      ]))
    ];

    shellHook = ''
      echo "---Development Environment Activated---"
      echo
      echo "[Dependencies]"
      echo "└─(Python)──> $(python --version)"
    '';

    # VARIABLE = "VALUE";
    # FILE = import ./something-else.nix
  }