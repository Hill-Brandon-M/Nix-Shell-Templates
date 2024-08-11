# flake.nix

{
  
  description = "A flake template for NodeJS projects";

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
          nodejs_22
        ];

        shellHook = ''
          echo '---Development Environment Activated---\n'
          echo "[Dependencies]"
          echo "└─(NodeJS)──> $(node --version)"
        '';

        # VARIABLE = "VALUE";
        # FILE = import ./something-else.nix
      };
    };
}