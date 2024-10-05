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
          deno
          bun
        ];

        shellHook = ''
          echo "---Development Environment Activated---"
          echo
          echo "[Dependencies]"
          echo "├─(NodeJS)──> $(node --version)"
          echo "├─(Deno)────> $(deno --version)"
          echo "└─(Bun)─────> $(bun --version)"
          echo 
        '';

        # VARIABLE = "VALUE";
        # FILE = import ./something-else.nix
      };
    };
}