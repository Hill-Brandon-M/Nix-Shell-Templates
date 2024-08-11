# flake.nix

{
  
  description = "An empty template importing a nix shell";

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
          libgcc
          gnumake
        ];

        shellHook = ''
          echo "---Development Environment Activated---"
          echo
          echo "[Dependencies]"
          echo "├─(GCC)───> $(gcc --version)"
          echo "└─(Make)──> $(make --version)"
        '';

        # VARIABLE = "VALUE";
        # FILE = import ./something-else.nix
      };
    };
}