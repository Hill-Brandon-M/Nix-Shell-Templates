# flake.nix

{
  
  description = "A flake template for Java projects.";

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
      };
    };
}