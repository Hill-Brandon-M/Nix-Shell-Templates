# flake.nix

{
  
  description = "A flake template for Python projects";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: 
    let 
      
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    
    in
    {
      
      devShells.${system}.default = pkgs.mkShell {
        
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
          echo
        '';

        # VARIABLE = "VALUE";
        # FILE = import ./something-else.nix
      };
    };
}