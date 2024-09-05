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
          # ...
        ];

        shellHook = ''
          # ...
          echo "Hello, Flake World!"
          echo
        '';

        # VARIABLE = "VALUE";
        # FILE = import ./something-else.nix
      };
    };
}