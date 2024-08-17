# flake.nix

{
  
  description = "A flake template for LaTeX document projects.";

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
        
        nativeBuildInputs = with pkgs; [
          texlive.combined.scheme-full
        ];

        shellHook = ''
          echo "---Development Environment Activated---"
          echo
          echo "[Dependencies]"
          echo "└─(TeX Live)───> $(tex --version)"
        '';

        # VARIABLE = "VALUE";
        # FILE = import ./something-else.nix
      };
    };
}